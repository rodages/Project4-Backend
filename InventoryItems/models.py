from django.db import models
from Users.models import CustomUser
# Create your models here.


class InventoryItem(models.Model):
    item_name = models.CharField(max_length=200, default=None, null=True)
    extra_from_checklist_amount = models.IntegerField(default=0)
    completed_status = models.BooleanField(default=False)
    order = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now=True, null=True)
    edited_at = models.DateTimeField(auto_now=True, null=True)
    #completed_by = models.ForeignKey(CustomUser, related_name="items_approved", null=True, on_delete=models.SET_NULL)
    # created_by ref to User

    def __str__(self):
        return f"{self.item_name}"
