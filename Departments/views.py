from rest_framework.views import APIView
from rest_framework.response import Response

from Departments.models import Department
from Departments.serializers import DepartmentSerializer


# Create your views here.
class DepartmentListView(APIView):
    def get(self, request):
        departments = Department.objects.all()
        serialized_departments = DepartmentSerializer(departments, many=True)
        return Response(serialized_departments.data)


class DepartmentDetailView(APIView):
    def get(self, _request, pk):
        department = Department.objects.get(id=pk)
        serialized_deparment = DepartmentSerializer(department, many=False)
        return Response(serialized_deparment.data)
