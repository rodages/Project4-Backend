from django.urls import path
from .views import SubsectionListView, SubsectionDetailView

urlpatterns = [
    path('', SubsectionListView.as_view()),
    path('<int:pk>', SubsectionDetailView.as_view())
]
