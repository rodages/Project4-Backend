from rest_framework import serializers
from .models import Checklist
#import Subsection, Task, Item


class ChecklistSerializer(serializers.ModelSerializer):

    #Subsections = Subsection(read_only=True, many=True)

    class Meta:
        model = Checklist
        fields = '__all__'
