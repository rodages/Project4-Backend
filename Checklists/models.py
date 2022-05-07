from django.db import models
from InventoryItems.models import InventoryItem
from Tasks.models import Task

# Create your models here.


class Checklist(models.Model):
    name = models.CharField(max_length=100, default=None)
    description = models.CharField(max_length=100, default=None)
    amount = models.PositiveIntegerField(default=0)
    created_at = models.DateTimeField(auto_now=True, null=True)
    edited_at = models.DateTimeField(auto_now=True, null=True)
    sales_target = models.FloatField(default=0)
    #checklist_sections = models.ManyToManyField(Subsection, blank=True, related_name="checklist_sections")
    inventory_items = models.ManyToManyField(
        InventoryItem, blank=True, related_name="checklist_items")
    tasks = models.ManyToManyField(
        Task, blank=True, related_name="checklist_tasks")

    # createdBy
    # lastEditedBy

    def __str__(self):
        return f"{self.name}"
