from pdb import post_mortem
from rest_framework import serializers
from .models import Shift


class ShiftSerializer(serializers.ModelSerializer):
    # checklist
    # worker_worked
    # worker_worker confirmed
    # department
    class Meta:
        model = Shift
        fields = '__all__'
