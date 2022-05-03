from rest_framework import serializers
from .models import Worker


class WorkerSerializer(serializers.ModelSerializer):
    departments = serializers.StringRelatedField(read_only=True, many=True)
    posts = serializers.StringRelatedField(read_only=True, many=True)

    class Meta:

        model = Worker
        fields = '__all__'
