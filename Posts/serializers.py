from rest_framework import serializers
from Users.models import CustomUser
from .models import Post


# class DepartmentSerializer(serializers.ModelSerializer):
#     class Meta:
#         model=Department
#         fields =

class CustomUserSerializer(serializers.ModelSerializer):
    departments = serializers.StringRelatedField(read_only=True, many=True)

    class Meta:
        model = CustomUser
        fields = ("first_name", "last_name", "role", "departments")


class PostSerializer(serializers.ModelSerializer):
    createdBy = CustomUserSerializer()

    class Meta:
        model = Post
        fields = "__all__"
