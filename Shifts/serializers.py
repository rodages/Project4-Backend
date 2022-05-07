from pdb import post_mortem
from rest_framework import serializers
from .models import Shift, ChecklistItem
from Checklists.models import Checklist


class ChecklistItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = ChecklistItem
        fields = '__all__'


class ShiftSerializer(serializers.ModelSerializer):
    #checklist = ChecklistItemSerializer(many=True)

    class Meta:
        model = Shift
        fields = '__all__'

    def create(self, data):
        checklist_data = data.pop("checklists")
        new_shift = Shift(**data)

        new_shift.save()
        if checklist_data:
            for checklist in checklist_data:
                current_checklist, _created = Checklist.objects.get_or_create(
                    pk=checklist.id)
                for task in current_checklist.tasks.all():
                    item = ChecklistItem(name="item name", comment="comment")
                    item.save()
                    new_shift.checklist.add(item)

                for item in current_checklist.inventory_items.all():
                    checklist_item = ChecklistItem(
                        name="task name", comment="none")
                    checklist_item.save()
                    new_shift.checklist.add(checklist_item)

                new_shift.checklists.add(current_checklist)

        return new_shift

    def update(self, shift, data):
        checklist_data = data.pop("checklists")

        shift.name = data.get("name", data.name)
        shift.description = data.get("description", data.description)
        shift.date = data.get("date", data.date)
        shift.start_time = data.get("start_time", data.start_time)
        shift.end_time = data.get("end_time", data.end_time)
        shift.created_by = data.get("created_by", data.created_by)

        if checklist_data:
            for checklist in checklist_data:
                new_checklist, _created = Checklist.objects.get_or_create(
                    **checklist)
                shift.checklists.add(new_checklist)

        shift.save()
        return shift
