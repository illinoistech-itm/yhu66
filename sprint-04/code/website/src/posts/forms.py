from django import forms
from django.contrib.auth import authenticate, get_user_model
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import Post

#Login Functionality
class UserLoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)

    def clean(self, *args, **kwargs):
        username = self.cleaned_data.get('username')
        password = self.cleaned_data.get('password')

        if username and password:
            user = authenticate(username=username, password=password)
            if not user:
                raise forms.ValidationError('Username or Password Incorrect')
            if not user.check_password(password):
                raise forms.ValidationError('Username or Password Incorrect')
            if not user.is_active:
                raise forms.ValidationError('Username is not active')

        return super(UserLoginForm, self).clean(*args, **kwargs)

#Registration Functionality
class UserRegisterForm(UserCreationForm):
    username = forms.CharField(label='Username', help_text=None)
    password1 = forms.CharField(label='Password', widget=forms.PasswordInput, help_text=None)
    password2 = forms.CharField(label='Password confirmation', widget=forms.PasswordInput, help_text=None)

    class Meta:
        model = User
        fields = ["username", "password1", "password2"]

#Making Posts Functionality
class UserPosts(forms.ModelForm):
    class Meta:
        model = Post
        fields = (
                'title',
                'overview',
                'thumbnail',
        )
