from django.contrib import admin
from django.urls import path, include
from app6 import views

urlpatterns = [
    path('user_reg/', views.user_reg, name='user_reg'),

    path('user_login/', views.user_login, name='user_login'),

    path('myuser_reg/', views.myuser_reg),
    path('app6/myuser_login/', views.myuser_login, name='app6_myuser_login'),
    path('myuser_logout/', views.myuser_logout, name='app6_myuser_logout'),
    path('myuser_edit/', views.myuser_edit, name='app6_myuser_edit'),
    path('user_index/', views.user_index, name='app6_user_index'),

    path("app6/test/", views.test, name="app6_test"),

    path("app6/index/", views.index),

    path("app6/cbv_cache/",views.CachePage.as_view()),
]
