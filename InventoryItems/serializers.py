from rest_framework import serializers
from .models import InventoryItem


class InventoryItemSerializer(serializers.ModelSerializer):

    class Meta:
        model = InventoryItem
        fields = '__all__'

    def create(self, data):
        inventoryItem = InventoryItem(**data)

        request = self.context.get("request")
        if request and hasattr(request, "user"):
            created_by = request.user
            inventoryItem.created_by = created_by

        inventoryItem.save()
        return inventoryItem

    def update(self, inventory_item, data):
        inventory_item.item_name = data.get(
            "item_name", inventory_item.item_name)
        inventory_item.save()
        return inventory_item
