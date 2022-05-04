from rest_framework import serializers
from .models import Task


class TaskSerializer(serializers.ModelSerializer):

    class Meta:
        model = Task
        fields = '__all__'

    def update(self, tasks, data):
        tasks.item_name = data.get(
            "item_name", tasks.item_name)
        tasks.save()
        return tasks
