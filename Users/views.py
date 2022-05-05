from rest_framework import generics
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from .models import CustomUser

from .serializers import RegisterSerializer, UsersSerializer, UpdateUserSerializer


# Create your views here.


class RegisterView(generics.CreateAPIView):
    """
    CreateAPIView ensures only a create operation is possible
    """
    permission_classes = [AllowAny]
    queryset = CustomUser.objects.all()
    serializer_class = RegisterSerializer

    # return Response({
    #     "user": CustomUserSerializer(user, context=self.get_serializer_context()).data,
    #     "message": "user created successfully!"
    # })


class UpdateUser(generics.RetrieveUpdateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = UpdateUserSerializer


class UsersListView(generics.ListAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = UsersSerializer
