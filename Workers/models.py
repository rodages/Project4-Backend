from django.contrib.auth.models import User
from django.db import models


# Create your models here.


class Worker(models.Model):
    first_name = models.CharField(max_length=30, default=None)
    last_name = models.CharField(max_length=50, default=None)
    role = models.CharField(max_length=30, default=None)
    postcode = models.CharField(max_length=10, default=None)
    active = models.BooleanField(default=False)
    registeredAt = models.DateTimeField(auto_now=True, null=True)
    updatedAt = models.DateTimeField(auto_now=True, null=True)
    userID = models.ForeignKey(
        User, related_name='workers', on_delete=models.CASCADE, null=True, default=None)

    def __str__(self):
        return f"{self.first_name} {self.last_name} [role:{self.role}, active:{self.active}]"
