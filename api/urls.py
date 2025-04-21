from django.urls import path
from .views import StudentListAPIView, SubjectListAPIView

urlpatterns = [
    path('students/', StudentListAPIView.as_view()),
    path('subjects/', SubjectListAPIView.as_view()),
]
