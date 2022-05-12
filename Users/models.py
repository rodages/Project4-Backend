from django.db import models
from django.contrib.auth.models import AbstractUser
from datetime import date

# Create your models here.


class CustomUser(AbstractUser):
    ROLE_CHOICES = (
        ("Regular Staff", "Regular Staff"),
        ("Supervisor", "Supervisor"),
        ("Manager", "Manager"),
        ("Director", "Director"),
    )
    DOB = models.DateField(default=date.today())
    postcode = models.CharField(
        max_length=10, default=None, null=True, blank=True)
    # need to delete null true
    role = models.CharField(
        max_length=50, choices=ROLE_CHOICES, default="Regular Staff", null=True)
#
