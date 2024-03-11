from django.db import models
class message(models.Model):
    user_name = models.CharField(max_length=50)
    title = models.CharField(max_length=50)
    body = models.CharField(max_length=200)
    post_at = models.DateTimeField(auto_now_add=True)
# Create your models here.
