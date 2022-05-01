from django.db import models

# Create your models here.


class Department(models.Model):

    name = models.CharField(max_length=50, default=None, unique=True)
    description = models.CharField(
        max_length=200, default=None, null=True, blank=True)
    image = models.CharField(
        max_length=200, default=None, null=True, blank=True)
    # link to users/workers
    # link to shifts

    def __str__(self):
        return self.name
