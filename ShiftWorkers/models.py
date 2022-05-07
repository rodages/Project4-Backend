from django.db import models
from Users.models import CustomUser
from Shifts.models import Shift

# Create your models here.


class ShiftWorker(models.Model):
    shift = models.ForeignKey(Shift, related_name="shift_info",
                              null=True, on_delete=models.SET_NULL, blank=True)
    worker = models.ForeignKey(CustomUser, related_name="shifts_worked_at",
                               null=True, on_delete=models.SET_NULL, blank=True)
    approved_by = models.ForeignKey(CustomUser, related_name="shifts_worked_at",
                                    null=True, on_delete=models.SET_NULL, blank=True)
    rating = models.PositiveIntegerField(default=0)
    feedback = models.CharField(max_length=500, default=None, null=True)
    start_time = models.TimeField(auto_now_add=True)
    end_time = models.TimeField(auto_now_add=True)
