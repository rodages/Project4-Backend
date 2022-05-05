from rest_framework import serializers
from .models import Checklist
from Subsections.models import Subsection
from Tasks.models import Task
from InventoryItems.models import InventoryItem


class InventoryItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = InventoryItem
        fields = ('__all__')


class TaskSerializer(serializers.ModelSerializer):
    class Meta:
        model = Task
        fields = '__all__'


class SubsectionSerializer(serializers.ModelSerializer):
    inventory_items = InventoryItemSerializer(many=True)
    tasks = TaskSerializer(many=True)

    class Meta:
        model = Subsection
        fields = '__all__'


class ChecklistSerializer(serializers.ModelSerializer):

    subsections = SubsectionSerializer(read_only=True, many=True)

    class Meta:
        model = Checklist
        fields = '__all__'
