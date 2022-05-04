from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.


class CustomUser(AbstractUser):
    DOB = models.DateField(auto_now=True)
    #REQUIRED_FIELDS = ['name', 'username', 'email', 'password']
