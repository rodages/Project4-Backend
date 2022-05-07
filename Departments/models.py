from django.db import models

from Users.models import CustomUser

# Create your models here.


class Department(models.Model):

    name = models.CharField(max_length=50, default=None, unique=True)
    description = models.CharField(
        max_length=200, default=None, null=True, blank=True)
    image = models.CharField(
        max_length=200, default=None, null=True, blank=True)
    # if user model gets extended,change to User
    workers = models.ManyToManyField(
        CustomUser, related_name="departments")
    # link to shifts

    def __str__(self):
        return self.name
