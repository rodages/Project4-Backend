from django.urls import path

from .views import WorkerListView, WorkerDetailView


urlpatterns = [
    path('', WorkerListView.as_view()),
    path('<int:pk>', WorkerDetailView.as_view()),
]
