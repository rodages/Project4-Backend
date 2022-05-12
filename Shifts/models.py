from datetime import date
from django.db import models
from Departments.models import Department
from Users.models import CustomUser
from Checklists.models import Checklist

# Create your models here.


class ChecklistItem(models.Model):
    name = models.CharField(max_length=100, default=None, null=True)
    comment = models.CharField(max_length=200, default=None, null=True)
    completed_status = models.BooleanField(default=False)
    order = models.IntegerField(default=0)
    extra_from_checklist_amount = models.IntegerField(null=True, default=0)

    assigned_to = models.CharField(
        max_length=50, default=None, null=True, blank=True)
    #completed_by = models.ForeignKey(CustomUser, related_name="completed", on_delete=models.SET_NULL, null=True, blank=True)

    checklist_name = models.CharField(max_length=100, default=None, null=True)
    section_name = models.CharField(
        max_length=100, default=None, null=True, blank=True)
    type = models.CharField(max_length=100, default="", null=True)


class Shift(models.Model):
    name = models.CharField(max_length=50, default=None)
    description = models.CharField(max_length=250, default=None)
    date = models.DateField(blank=True, null=True, )
    start_time = models.TimeField(auto_now_add=True)
    end_time = models.TimeField(auto_now_add=True)
    leaving_pier = models.TimeField(null=True, blank=True, default=None)
    boarding = models.TimeField(null=True, blank=True, default=None)
    dropoff = models.TimeField(null=True, blank=True, default=None)

    used_as_template = models.BooleanField(default=False)

    department = models.ForeignKey(
        Department, related_name="shifts", null=True, on_delete=models.SET_NULL, blank=True)
    created_by = models.ForeignKey(
        CustomUser, related_name="checklists_created", on_delete=models.SET_NULL, null=True)
    checklists = models.ManyToManyField(
        Checklist, related_name="shifts", blank=True, null=True)
    checklist_items = models.ManyToManyField(
        ChecklistItem, related_name="items", blank=True, null=True)

    def __str__(self):
        return f"{self.name} - {self.description}"
