from rest_framework import generics
from .models import Shift
from Shifts.serializers import ShiftSerializer, ShiftTemplateSerializer

# Create your views here.


class ShiftListView(generics.ListCreateAPIView):
    queryset = Shift.objects.all()
    serializer_class = ShiftSerializer


class ShiftBoolView(generics.ListCreateAPIView):
    serializer_class = ShiftTemplateSerializer

    def get_queryset(self):
        return Shift.objects.filter(used_as_template=True)


class ShiftDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Shift.objects.all()
    serializer_class = ShiftSerializer
