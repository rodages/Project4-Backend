from django.db import models
from Users.models import CustomUser
# Create your models here.


class InventoryItem(models.Model):
    SECTION_TYPES = (
        ("Crockery", "Crockery"),
        ("Cutlery", "Cutlery"),
        ("Serving Tools", "Serving Tools"),
        ("Food Serivce Area", "Food Serivce Area"),
        ("Drinks Bar", "Drinks Bar"),
        ("Supervising", "Supervising"),
        ("Other", "Other"),
    )
    section_name = models.CharField(
        max_length=50, choices=SECTION_TYPES, default="Other", null=True)
    name = models.CharField(max_length=200, default=None, null=True)
    comment = models.CharField(
        max_length=500, default=None, null=True, blank=True)
    extra_from_checklist_amount = models.IntegerField(default=0, blank=True)

    created_at = models.DateTimeField(auto_now=True, null=True)
    edited_at = models.DateTimeField(auto_now=True, null=True)

    created_by = models.ForeignKey(
        CustomUser, related_name="created_items", null=True, on_delete=models.SET_NULL)
    edited_by = models.ForeignKey(
        CustomUser, related_name="edited_items", null=True, on_delete=models.SET_NULL, blank=True)

    def __str__(self):
        return f"{self.name}"
