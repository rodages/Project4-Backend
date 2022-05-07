from datetime import date
from django.db import models
from Departments.models import Department

# Create your models here.


class Shift(models.Model):
    name = models.CharField(max_length=50, default=None)
    description = models.CharField(max_length=250, default=None)
    date = models.DateField(blank=True, null=True, )
    start_time = models.TimeField(auto_now_add=True)
    end_time = models.TimeField(auto_now_add=True)
    department = models.ForeignKey(
        Department, related_name="shifts", null=True, on_delete=models.SET_NULL, blank=True)
    # createdBy

    # feedback
    # rating
    # confirmedBy
    # workerID
    def __str__(self):
        return f"{self.name} - {self.description}"
