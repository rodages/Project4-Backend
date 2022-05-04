from rest_framework import serializers
from .models import InventoryItem


class InventoryItemSerializer(serializers.ModelSerializer):

    class Meta:
        model = InventoryItem
        fields = '__all__'

    def update(self, inventory_item, data):
        inventory_item.item_name = data.get(
            "item_name", inventory_item.item_name)
        inventory_item.save()
        return inventory_item
