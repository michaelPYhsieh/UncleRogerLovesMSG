from django.db import models

# Create your models here.
from django.urls import reverse


class Post(models.Model):
    username = models.CharField(max_length=30)
    txt = models.TextField(verbose_name='')
    # date = models.DateTimeField(auto_now_add=True)
    date = models.DateTimeField()
