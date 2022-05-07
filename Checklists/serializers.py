from rest_framework import serializers
from .models import Checklist
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


class ChecklistSerializer(serializers.ModelSerializer):
    inventory_items = InventoryItemSerializer(many=True)
    tasks = TaskSerializer(many=True)

    class Meta:
        model = Checklist
        fields = '__all__'

    def create(self, data):
        inventory_items_data = data.pop("inventory_items")
        tasks_data = data.pop("tasks")

        checklist = Checklist(**data)
        checklist.save()

        if inventory_items_data:
            for item in inventory_items_data:
                new_item, _created = InventoryItem.objects.get_or_create(
                    **item)
                checklist.inventory_items.add(new_item)

        if tasks_data:
            for task in tasks_data:
                new_task, _created = Task.objects.get_or_create(
                    **task)
                checklist.tasks.add(new_task)

        return checklist

    def update(self, checklist, data):
        inventory_items_data = data.pop("inventory_items")
        tasks_data = data.pop("tasks")

        # subsection params
        checklist.name = data.get("name", checklist.name)

        if inventory_items_data:
            for item in inventory_items_data:
                new_item, _created = InventoryItem.objects.get_or_create(
                    **item)
                checklist.inventory_items.add(new_item)

        if tasks_data:
            for task in tasks_data:
                new_task, _created = Task.objects.get_or_create(
                    **task)
                checklist.tasks.add(new_task)

        checklist.save()
        return checklist
