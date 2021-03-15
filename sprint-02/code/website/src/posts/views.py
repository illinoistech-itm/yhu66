from django.db.models import Count, Q
from django import forms
from django.views.generic.base import TemplateView
from django.contrib.auth import login, logout, authenticate, get_user_model
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render, redirect
from .models import Post
from .forms import UserLoginForm

# Create your views here.

def login_view(request):
    next = request.GET.get('next')
    form = UserLoginForm(request.POST or None)
    if form.is_valid():
        username = form.cleaned_data.get('username')
        password = form.cleaned_data.get('password')
        user = authenticate(username=username, password=password)
        login(request, user)
        if next:
            return redirect(next)
        return redirect('/')

    context ={
        'form': form,
    }

    return render(request, "accounts/login.html", context)




def search(request):
    post_list = Post.objects.all()
    search = request.GET.get('ser')
    if search:
        post_list = post_list.filter(
            Q(title__icontains=search) |
            Q(overview__icontains=search)
        ).distinct()
    context = {
        'post_list': post_list
    }
    return render(request, 'search_results.html', context)

def categories_count():
    queryset = Post.objects.values('categories__title').annotate(Count('categories__title'))
    return queryset

def index(request):

    queryset = Post.objects.filter(featured=True)
    context = {
        'object_list': queryset
    }

    return render(request, 'index.html', context)


def blog(request):

    cat_count = categories_count()
    most_recent = Post.objects.order_by('-timestamp')[:3]
    all_post = Post.objects.all()
    paginator = Paginator(all_post, 4)
    page_request_var = 'page'
    page = request.GET.get(page_request_var)
    try:
        paginated_queryset = paginator.page(page)
    except PageNotAnInteger:
        paginated_queryset = paginator.page(1)
    except EmptyPage:
        paginated_queryset = paginator.page(paginator.num_pages)

    context = {
        'post_list': paginated_queryset,
        'most_recent': most_recent,
        'cat_count': cat_count,
        'page_request_var': page_request_var
    }

    return render(request, 'blog.html', context)


def post(request, id):
    return render(request, 'post.html', {})

class ProfileView(LoginRequiredMixin, TemplateView):
    template_name = 'accounts/profile.html'