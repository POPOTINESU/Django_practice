from django.db import models
class message(models.Model):
    user_name = models.CharField(max_length=50)
    title = models.CharField(max_length=50)
    body = models.CharField(max_length=200)
    post_at = models.DateTimeField(auto_now_add=True)
# Create your models here.
class Board(models.Model):
    title = models.CharField(blank=False, null=False,max_length=150)
    text = models.TextField(blank=True)
    created_datetime = models.DateTimeField(auto_now_add=True)
    updated_datetime = models.DateTimeField(auto_now=True)

def __str__(self):
    return self.title
