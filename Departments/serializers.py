from rest_framework import serializers
from .models import Department
from Workers.models import Worker


class WorkerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Worker
        fields = ("first_name", "last_name", "role", "active", "userID")


class DepartmentSerializer(serializers.ModelSerializer):

    workers = WorkerSerializer(read_only=True, many=True)

    class Meta:
        model = Department
        fields = '__all__'
