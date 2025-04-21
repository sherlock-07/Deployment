# Create your views here.
from rest_framework import generics
from .models import Student, Subject
from .serializers import StudentSerializer, SubjectSerializer

class StudentListAPIView(generics.ListAPIView):
    queryset = Student.objects.all()
    serializer_class = StudentSerializer

class SubjectListAPIView(generics.ListAPIView):
    queryset = Subject.objects.all()
    serializer_class = SubjectSerializer
