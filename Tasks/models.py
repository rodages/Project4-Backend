from django.db import models
from Users.models import CustomUser

# Create your models here.


class Task(models.Model):
    name = models.CharField(max_length=200, default=None, null=True)
    comment = models.CharField(max_length=500, default=None, null=True)

    created_at = models.DateTimeField(auto_now_add=True, null=True)
    edited_at = models.DateTimeField(auto_now=True, null=True)

    created_by = models.ForeignKey(
        CustomUser, related_name="created_tasks", null=True, on_delete=models.SET_NULL, blank=True)

    def __str__(self):
        return f"{self.task_name}"
