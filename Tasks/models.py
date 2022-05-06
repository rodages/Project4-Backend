from django.db import models
from Users.models import CustomUser

# Create your models here.


class Task(models.Model):
    task_name = models.CharField(max_length=200, default=None, null=True)
    comments = models.CharField(max_length=500, default=None, null=True)
    created_at = models.DateTimeField(auto_now_add=True, null=True)
    edited_at = models.DateTimeField(auto_now=True, null=True)
    completed_status = models.BooleanField(default=False)
    order = models.IntegerField(default=0)
    completed_by = models.ForeignKey(
        CustomUser, related_name="completed_tasks", null=True, on_delete=models.SET_NULL, blank=True)
    # created_by ref to User

    def __str__(self):
        return f"{self.task_name}"
