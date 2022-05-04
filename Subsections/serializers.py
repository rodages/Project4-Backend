from rest_framework import serializers
from .models import Subsection


class SubsectionSerializer(serializers.ModelSerializer):

    #Items = Item(read_only=True, many=True)

    class Meta:
        model = Subsection
        field = '__all__'
