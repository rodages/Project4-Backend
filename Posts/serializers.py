from rest_framework import serializers
from Users.models import CustomUser
from Departments.models import Department
from .models import Post


# class DepartmentSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Department
#         fields = '__all__'


class CustomUserSerializer(serializers.ModelSerializer):
    departments = serializers.StringRelatedField(read_only=True, many=True)

    class Meta:
        model = CustomUser
        fields = ("first_name", "last_name", "role", "departments")


class PostSerializer(serializers.ModelSerializer):
    createdBy = CustomUserSerializer(read_only=True)
    # department = DepartmentSerializer(read_only=True)

    class Meta:
        model = Post
        fields = "__all__"

    def create(self, data):

        department = Department.objects.get(id=data['departmentID'])

        post = Post(**data)
        post.department = department
        request = self.context.get("request")

        if request and hasattr(request, "user"):
            created_by = request.user
            post.createdBy = created_by

        post.save()
        return post
