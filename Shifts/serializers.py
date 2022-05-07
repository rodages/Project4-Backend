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
        print("running create")
        checklists = data.pop("checklists")
        print("checklists", checklists)
        new_shift = Shift(data)

        new_shift.save()
        for checklist in checklists:
            #current_checklist = Checklist.objects.get(pk=checklist.id)
            current_checklist = Checklist.objects.get(checklist)
            print("current checklist", current_checklist)

            for task in current_checklist.tasks:
                item = ChecklistItem(name="item name", comment="comment")
                item.save()
                new_shift.checklist.add(item)

            for item in current_checklist.inventory_items:
                checklist_item = ChecklistItem(
                    name="task name", comment="none")
                checklist_item.save()
                new_shift.checklist.add(checklist_item)

        return new_shift
