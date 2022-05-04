from django.db import models

# Create your models here.


class Subsection(models.Model):
    name = models.CharField(max_length=200, default=None, null=True)
    created_at = models.DateTimeField(auto_now=True, null=True)
    edited_at = models.DateTimeField(auto_now=True, null=True)
    # createdBy
    # lastEditedBy
