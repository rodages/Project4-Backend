from django.urls import path
from Posts.views import PostListView, PostDetailView

urlpatterns = [
    path('', PostListView.as_view()),
    path('<str:pk>/', PostDetailView.as_view()),
]
