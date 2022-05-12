from django.db import models
from Users.models import CustomUser
from Departments.models import Department

# Create your models here.


class Post(models.Model):
    title = models.CharField(max_length=50, default=None)
    content = models.CharField(
        max_length=1000, default=None)
    createdAt = models.DateTimeField(auto_now=True, null=True)
    updatedAt = models.DateTimeField(auto_now=True, null=True)
    createdBy = models.ForeignKey(
        CustomUser, on_delete=models.CASCADE, null=True, blank=True, related_name="users_posts")
    department = models.ForeignKey(
        Department, on_delete=models.CASCADE, null=True, blank=True, related_name="department_posts")

    def __str__(self):
        return f"{self.createdBy}-{self.title}"
