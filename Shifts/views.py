from rest_framework import generics
from .models import Shift
from Shifts.serializers import ShiftSerializer

# Create your views here.


class ShiftListView(generics.ListCreateAPIView):
    queryset = Shift.objects.all
    serializer_class = ShiftSerializer


class ShiftDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Shift.objects.all
    serializer_class = ShiftSerializer
