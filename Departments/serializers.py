from rest_framework import serializers
from .models import Department
from Users.models import CustomUser


class WorkerSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ("__all__")
        #fields = ("first_name", "last_name", "role", "active", "userID")


class DepartmentSerializer(serializers.ModelSerializer):

    workers = WorkerSerializer(read_only=True, many=True)

    class Meta:
        model = Department
        fields = '__all__'
