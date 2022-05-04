from django.urls import path

from .views import ChecklistListView, ChecklistDetailView

urlpatterns = [
    path('', ChecklistListView.as_view()),
    path('<int:pk>/', ChecklistDetailView.as_view())
]
