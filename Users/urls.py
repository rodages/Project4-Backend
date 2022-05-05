from django.urls import path

from .views import RegisterView, UpdateUser, UsersListView

urlpatterns = [
    path('register', RegisterView.as_view()),
    path('users/', UsersListView.as_view()),
    path('update/<int:pk>', UpdateUser.as_view())
]
