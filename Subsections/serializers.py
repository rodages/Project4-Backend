from asyncio import Task
from rest_framework import serializers

from InventoryItems.models import InventoryItem
from Tasks.models import Task
from .models import Subsection

# eventually need to hide id - display only 'item_name',extra_from_checklist_amount','completed_status','created_at','edited_at'
# also relationships


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
        fields = ('__all__')

    def create(self, data):
        inventory_items_data = data.pop("inventory_items")
        tasks_data = data.pop("tasks")

        subsection = Subsection(**data)
        subsection.save()

        if inventory_items_data:
            for item in inventory_items_data:
                new_item, _created = InventoryItem.objects.get_or_create(
                    **item)
                subsection.inventory_items.add(new_item)

        if tasks_data:
            for task in tasks_data:
                new_task, _created = Task.objects.get_or_create(
                    **task)
                subsection.tasks.add(new_task)

        return subsection

    def update(self, subsection, data):
        inventory_items_data = data.pop("inventory_items")
        tasks_data = data.pop("tasks")

        # subsection params
        subsection.name = data.get("name", subsection.name)

        if inventory_items_data:
            for item in inventory_items_data:
                new_item, _created = InventoryItem.objects.get_or_create(
                    **item)
                subsection.inventory_items.add(new_item)

        if tasks_data:
            for task in tasks_data:
                new_task, _created = Task.objects.get_or_create(
                    **task)
                subsection.tasks.add(new_task)

        subsection.save()
        return subsection
