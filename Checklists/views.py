from rest_framework import generics

from Checklists.models import Checklist
from Checklists.serializers import ChecklistSerializer

# Create your views here.


class ChecklistListView(generics.ListCreateAPIView):
    queryset = Checklist.objects.all()
    serializer_class = ChecklistSerializer


class ChecklistDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Checklist.objects.all()
    serializer_class = ChecklistSerializer
