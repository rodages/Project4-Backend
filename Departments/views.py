# from rest_framework.views import APIView
# from rest_framework.response import Response
from rest_framework import generics

from Departments.models import Department
from Departments.serializers import DepartmentSerializer


# Create your views here.
class DepartmentListView(generics.ListCreateAPIView):
    queryset = Department.objects.all()
    serializer_class = DepartmentSerializer
    # def get(self, request):
    #     departments = Department.objects.all()
    #     serialized_departments = DepartmentSerializer(departments, many=True)
    #     return Response(serialized_departments.data)

    # def post(self, request, format=None):
    #     serializer = DepartmentSerializer(data=request.data)
    #     if serializer.is_valid():
    #         serializer.save()
    #         return Response(serializer.data, status=status.HTTP_201_CREATED)
    #     return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class DepartmentDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Department.objects.all()
    serializer_class = DepartmentSerializer

    # def get(self, _request, pk):
    #     department = Department.objects.get(id=pk)
    #     serialized_deparment = DepartmentSerializer(department, many=False)
    #     return Response(serialized_deparment.data)

    # def put(self, request, pk, format=None):
    #     department = Department.objects.get(id=pk)
    #     serialized_department = DepartmentSerializer(
    #         department, data=request.data)
    #     if serialized_department.is_valid():
    #         serialized_department.save()
    #         return Response(serialized_department.data)
    #     return Response(serialized_department.errors, status=status.HTTP_400_BAD_REQUEST)

    # def delete(self, request, pk, format=None):
    #     department = Department.objects.get(id=pk)
    #     department.delete()
    #     return Response(status=status.HTTP_204_NO_CONTENT)
