from django.urls import path
from app1 import views

urlpatterns = [

    path('app1/index/', views.index)
]
