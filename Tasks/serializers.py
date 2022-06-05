from rest_framework import serializers
from .models import Task


class TaskSerializer(serializers.ModelSerializer):
    # checklist_tasks = serializers.StringRelatedField(many=True, read_only=True)

    class Meta:
        model = Task
        fields = '__all__'

    def create(self, data):
        print("got hit")
        print(data)
        task = Task(**data)

        request = self.context.get("request")
        print(request.user)
        if request and hasattr(request, "user"):
            print(request.user)
            if(request.user == "AnonymousUser"):
                print("cought")
        # created_by = request.user
        # task.created_by = created_by

        task.save()
        return task

    def update(self, tasks, data):
        tasks.item_name = data.get(
            "item_name", tasks.item_name)
        tasks.save()
        return tasks
