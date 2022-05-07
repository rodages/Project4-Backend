from django.db import models
from Users.models import CustomUser
# Create your models here.


class InventoryItem(models.Model):
    name = models.CharField(max_length=200, default=None, null=True)
    comment = models.CharField(max_length=500, default=None, null=True)
    extra_from_checklist_amount = models.IntegerField(default=0)

    created_at = models.DateTimeField(auto_now=True, null=True)
    edited_at = models.DateTimeField(auto_now=True, null=True)

    created_by = models.ForeignKey(
        CustomUser, related_name="created_items", null=True, on_delete=models.SET_NULL)

    def __str__(self):
        return f"{self.item_name}"
