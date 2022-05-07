from datetime import date
from django.db import models
from Departments.models import Department
from Users.models import CustomUser

# Create your models here.


class ChecklistItem(models.Model):
    name = models.CharField(max_length=100, default=None, null=True)
    comment = models.CharField(max_length=200, default=None, null=True)
    completed_status = models.BooleanField(default=False)
    order = models.IntegerField(default=0)
    count = models.BigIntegerField(null=True, default=0)
    completed_by = models.ForeignKey(
        CustomUser, related_name="completed", on_delete=models.SET_NULL, null=True)


class Shift(models.Model):
    name = models.CharField(max_length=50, default=None)
    description = models.CharField(max_length=250, default=None)
    date = models.DateField(blank=True, null=True, )
    start_time = models.TimeField(auto_now_add=True)
    end_time = models.TimeField(auto_now_add=True)
    department = models.ForeignKey(
        Department, related_name="shifts", null=True, on_delete=models.SET_NULL, blank=True)
    created_by = models.ForeignKey(
        CustomUser, related_name="checklists_created", on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return f"{self.name} - {self.description}"
