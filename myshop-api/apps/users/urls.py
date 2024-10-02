from django.contrib import admin
from django.urls import path, include, re_path
from apps.users import views
from django.views.static import serve
from myshop import settings
from rest_framework.routers import DefaultRouter

user_list = views.MyUserViewSet.as_view({
    'get': 'retrieve',
    'post': 'create',
})

user_detail = views.MyUserViewSet.as_view({
    'get': 'retrieve',
    'put': 'update',
    'patch': 'partial_update',
    'delete': 'destroy',
})

urlpatterns = [
    path('users/', user_list),

    path('users/<pk>/', user_detail),  # 查找、更新、删除

]
