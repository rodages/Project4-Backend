from rest_framework import serializers

from .models import Department
from Users.models import CustomUser
from Posts.models import Post
from Checklists.models import Checklist


class WorkerSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ("__all__")
        #fields = ("first_name", "last_name", "role", "active", "userID")


class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = '__all__'


class ChecklistSerializer(serializers.ModelSerializer):
    class Meta:
        model = Checklist
        fields = '__all__'


class DepartmentSerializer(serializers.ModelSerializer):

    workers = WorkerSerializer(read_only=True, many=True)
    department_checklists = ChecklistSerializer(read_only=True, many=True)
    department_posts = PostSerializer(
        many=True, read_only=True)

    class Meta:
        model = Department
        fields = '__all__'
