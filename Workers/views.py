from rest_framework import generics

from Workers.models import Worker
from Workers.serializers import WorkerSerializer


class WorkerListView(generics.ListCreateAPIView):
    queryset = Worker.objects.all()
    serializer_class = WorkerSerializer


class WorkerDetailView(generics.RetrieveDestroyAPIView):
    queryset = Worker.objects.all()
    serializer_class = WorkerSerializer
