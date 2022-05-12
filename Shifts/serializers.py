from pdb import post_mortem
from rest_framework import serializers
from .models import Shift, ChecklistItem
from Checklists.models import Checklist


class ChecklistItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = ChecklistItem
        fields = '__all__'


class ShiftTemplateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Shift
        fields = ('id', 'used_as_template')


class ShiftSerializer(serializers.ModelSerializer):
    checklist_items = ChecklistItemSerializer(many=True)
    hours = serializers.IntegerField(required=True, write_only=True)
    minutes = serializers.IntegerField(required=True, write_only=True)

    class Meta:
        model = Shift
        fields = '__all__'

    def create(self, data):
        checklists_data = None
        checklist_item_data = None
        print(data)
        if hasattr(data, "checklists"):
            checklists_data = data.pop("checklists")
        if hasattr(data, "checklist_items"):
            checklist_item_data = data.pop("checklist_items")
        new_shift = Shift(**data)

        new_shift.save()
        if checklists_data:
            for checklist in checklists_data:
                current_checklist, _created = Checklist.objects.get_or_create(
                    pk=checklist.id)
                for task in current_checklist.tasks.all():
                    item = ChecklistItem(
                        name=task.name,
                        comment=task.comment,
                        extra_from_checklist_amount=task.extra_from_checklist_amount,
                        checklist_name=current_checklist.name,
                        section_name=task.section_name,
                        type="task"

                    )
                    item.save()
                    new_shift.checklist_items.add(item)

                for item in current_checklist.inventory_items.all():
                    checklist_item = ChecklistItem(
                        name=item.name,
                        comment=item.comment,
                        extra_from_checklist_amount=item.extra_from_checklist_amount,
                        checklist_name=current_checklist.name,
                        section_name=item.section_name,
                        type="item")
                    checklist_item.save()
                    new_shift.checklist_items.add(checklist_item)

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
