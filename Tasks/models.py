from django.db import models

# Create your models here.


class Task(models.Model):
    Task_name = models.CharField(max_length=200, default=None, null=True)
    comments = models.CharField(max_length=500, default=None, null=True)
    created_at = models.DateTimeField(auto_now=True, null=True)
    edited_at = models.DateTimeField(auto_now=True, null=True)
    # completed_by ref to User
    # created_by ref to User
