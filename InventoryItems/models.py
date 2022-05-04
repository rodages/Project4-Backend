from django.db import models

# Create your models here.


class InventoryItem(models.Model):
    itemName = models.CharField(max_length=200, default=None, null=True)
    extraFromChecklistAmount = models.IntegerField(default=0)
    completed_status = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now=True, null=True)
    edited_at = models.DateTimeField(auto_now=True, null=True)
    # completed_by ref to User
    # created_by ref to User
