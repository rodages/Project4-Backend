from django.db import models
from Users.models import CustomUser

# Create your models here.


class Task(models.Model):
    SECTION_TYPES = (
        ("Pre-Departure", "Pre-Departure"),
        ("Briefing", "Briefing"),
        ("Sightseeing Boat", "Sightseeing Boat"),
        ("Last Cruise of the day", "Last Cruise of the day"),
        ("Pier Works", "Pier Works"),
        ("Kitchen", "Kitchen"),
        ("Other", "Other"),
    )
    section_name = models.CharField(
        max_length=50, choices=SECTION_TYPES, default="Other", null=True)
    name = models.CharField(max_length=200, default=None, null=True)
    image = models.CharField(
        max_length=200, default=None, null=True, blank=True)
    comment = models.CharField(
        max_length=500, default=None, null=True, blank=True)
    extra_from_checklist_amount = models.IntegerField(default=0, blank=True)

    created_at = models.DateTimeField(auto_now_add=True, null=True)
    edited_at = models.DateTimeField(auto_now=True, null=True)

    created_by = models.ForeignKey(
        CustomUser, related_name="created_tasks", null=True, on_delete=models.SET_NULL, blank=True)
    edited_by = models.ForeignKey(
        CustomUser, related_name="edited_tasks", null=True, on_delete=models.SET_NULL, blank=True)

    def __str__(self):
        return f"{self.name}"
