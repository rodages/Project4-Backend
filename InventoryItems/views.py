from rest_framework import generics

from InventoryItems.models import InventoryItem
from InventoryItems.serializers import InventoryItemSerializer

# Create your views here.


class InventoryItemListView(generics.ListCreateAPIView):
    queryset = InventoryItem.objects.all()
    serializer_class = InventoryItemSerializer


class InventoryItemDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = InventoryItem.objects.all()
    serializers_class = InventoryItemSerializer
