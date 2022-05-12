from django.db import models
from InventoryItems.models import InventoryItem
from Tasks.models import Task
from Departments.models import Department

# Create your models here.


class Checklist(models.Model):
    name = models.CharField(max_length=100, default=None)
    description = models.CharField(
        max_length=100, default=None, blank=True, null=True)
    created_at = models.DateTimeField(auto_now=True, null=True)
    edited_at = models.DateTimeField(auto_now=True, null=True)
    sales_target = models.FloatField(default=0)
    inventory_items = models.ManyToManyField(
        InventoryItem, blank=True, related_name="checklist_items")
    tasks = models.ManyToManyField(
        Task, blank=True, related_name="checklist_tasks")
    department = models.ForeignKey(
        Department, on_delete=models.CASCADE, null=True, blank=True, related_name="department_checklists")
    # createdBy
    # lastEditedBy

    def __str__(self):
        return f"{self.name}"
