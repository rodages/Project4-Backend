from django.db import models
from Workers.models import Worker

# Create your models here.


class Post(models.Model):
    title = models.CharField(max_length=50, default=None)
    content = models.CharField(
        max_length=1000, default=None)
    createdAt = models.DateTimeField(auto_now=True, null=True)
    updatedAt = models.DateTimeField(auto_now=True, null=True)
    createdBy = models.ForeignKey(
        Worker, on_delete=models.CASCADE, null=True, related_name="posts")

    def __str__(self):
        return f"{self.createdBy}-{self.title}"
