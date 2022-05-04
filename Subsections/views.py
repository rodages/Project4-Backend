from rest_framework import generics
from Subsections.models import Subsection
from Subsections.serializers import SubsectionSerializer

# Create your views here.


class SubsectionListView(generics.ListCreateAPIView):
    queryset = Subsection.objects.all()
    serializer_class = SubsectionSerializer


class SubsectionDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Subsection.objects.all()
    serializer_class = SubsectionSerializer
