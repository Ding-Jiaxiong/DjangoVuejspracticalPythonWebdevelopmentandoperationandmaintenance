from django.contrib import admin
from django.urls import path, include, re_path
from app4 import views
from myshop import settings
from django.templatetags.static import static
from django.views.static import serve

urlpatterns = [
    path('userinfo_trans/', views.userinfo_trans, name='userinfo_trans'),
]
