"""bugvilleWebsite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
#Library dependancies
from django.contrib import admin
from django.urls import path
from django.conf.urls.static import static
from django.conf import settings
from django.contrib.auth import views as auth_views

#Calls the page views from our posts app
from posts.views import index, blog, post, ProfileView, search, login_view, registerPage, contactPage, create

#URLs of site
urlpatterns = [
    #Django Base Admin account --Many want to disable for production--
    path('admin/', admin.site.urls),

    #Login and Logout paths --Set to index redirect--
    path('login', login_view, name='login'),
    path('accounts/logout', auth_views.LogoutView.as_view(), name='logout'),

    #User Prifile page
    path('profile', ProfileView.as_view(), name='profile'),

    #Registration
    path('signup', registerPage, name='signup'),

    #Make Posts
    path('makepost', create, name='makepost'),

    #Contact page
    path('contact', contactPage, name='contact'),

    #Site Pages
    path('', index, name='index'),
    path('blog', blog, name='blog'),
    path('post/<id>/', post, name='post-detail'), #Need to switch from <id> to slug

    path('search', search, name='search')
]

#DEBUG settings
if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
