from django.db import models

# Create your models here.


class Checklist(models.Model):
    name = models.CharField(max_length=100, default=None)
    description = models.CharField(max_length=100, default=None)
    Amount = models.PositiveIntegerField(default=0)
    created_at = models.DateTimeField(auto_now=True, null=True)
    edited_at = models.DateTimeField(auto_now=True, null=True)
    # createdBy
    # lastEditedBy

    def __str__(self):
        return f"{self.name}"


class Subsection(models.Model):
    name = models.CharField(max_length=200, default=None, null=True)
    created_at = models.DateTimeField(auto_now_add=True, null=True)
    edited_at = models.DateTimeField(auto_now=True, null=True)
    # createdBy
    # lastEditedBy

    def __str__(self):
        return f"{self.name}"


class InventoryItem(models.Model):
    item_name = models.CharField(max_length=200, default=None, null=True)
    extra_from_checklist_amount = models.IntegerField(default=0)
    completed_status = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now=True, null=True)
    edited_at = models.DateTimeField(auto_now=True, null=True)
    # completed_by ref to User
    # created_by ref to User

    def __str__(self):
        return f"{self.item_name}"


class Task(models.Model):
    task_name = models.CharField(max_length=200, default=None, null=True)
    comments = models.CharField(max_length=500, default=None, null=True)
    created_at = models.DateTimeField(auto_now=True, null=True)
    edited_at = models.DateTimeField(auto_now=True, null=True)
    # completed_by ref to User
    # created_by ref to User

    def __str__(self):
        return f"{self.task_name}"
