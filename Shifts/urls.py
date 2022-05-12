from django.urls import path
from Shifts.views import ShiftListView, ShiftDetailView, ShiftBoolView

urlpatterns = [
    path('', ShiftListView.as_view()),
    path('template', ShiftBoolView.as_view()),
    path('<int:pk>/', ShiftDetailView.as_view()),
]
