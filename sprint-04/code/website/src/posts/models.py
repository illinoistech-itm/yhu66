from django.db import models
from django.contrib.auth import get_user_model
from django.urls import reverse

# Create your models here.

User = get_user_model()

#DB Entry Author
class Author(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    profile_picture = models.ImageField()

    def __str__(self):
        return self.user.username

#DB entry for Category
class Category(models.Model):
    title = models.CharField(max_length=20)

    def __str__(self):
        return self.title

#DB entry for Posts
class Post(models.Model):
    title = models.CharField(max_length=100)
    overview = models.TextField()
    timestamp = models.DateTimeField(auto_now_add=True)
    comment_count = models.IntegerField(default = 0)
    view_count = models.IntegerField(default = 0)
    author = models.TextField()
    profile_picture = models.ImageField(upload_to='profile_pic', default='avatar-1.jpg')
    thumbnail = models.ImageField(upload_to='profile_pic', default='blog-post-2.jpg')
    categories = models.ManyToManyField(Category)
    featured = models.BooleanField(default = False)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('post-detail', kwargs={
            'id': self.id
        })


