from django.db import models

# Create your models here.


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
