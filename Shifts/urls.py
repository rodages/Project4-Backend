from django.urls import path
from Shifts.views import ShiftListView, ShiftDetailView

urlpatterns = [
    path('', ShiftListView.as_view()),
    path('<int:pk>/', ShiftDetailView.as_view()),
]
