from django.urls import path, include
from apps.basic import views

urlpatterns = [
    path('index/', views.index),
]