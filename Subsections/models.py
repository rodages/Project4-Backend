from django.db import models
from InventoryItems.models import InventoryItem
from Tasks.models import Task

# Create your models here.


class Subsection(models.Model):
    name = models.CharField(max_length=200, default=None, null=True)
    created_at = models.DateTimeField(auto_now=True, null=True)
    edited_at = models.DateTimeField(auto_now=True, null=True)
    inventory_items = models.ManyToManyField(
        InventoryItem, blank=True, related_name="subsection_items")
    tasks = models.ManyToManyField(
        Task, blank=True, related_name="subsection_tasks")
    # createdBy
    # lastEditedBy

    def __str__(self):
        return f"{self.name}"
