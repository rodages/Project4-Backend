from rest_framework import serializers
from Workers.models import Worker
from .models import Post


# class DepartmentSerializer(serializers.ModelSerializer):
#     class Meta:
#         model=Department
#         fields =

class WorkerSerializer(serializers.ModelSerializer):
    departments = serializers.StringRelatedField(read_only=True, many=True)

    class Meta:
        model = Worker
        fields = ("first_name", "last_name", "role", "departments")


class PostSerializer(serializers.ModelSerializer):
    createdBy = WorkerSerializer()

    class Meta:
        model = Post
        fields = "__all__"
