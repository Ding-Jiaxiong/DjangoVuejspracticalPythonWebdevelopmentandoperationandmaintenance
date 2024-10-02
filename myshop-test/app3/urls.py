from django.contrib import admin
from django.urls import path, include
from app3 import views

urlpatterns = [
    path('var/', views.var, name='var'),

    path('for_label/', views.for_label, name='for_label'),

    path('filter/', views.filter, name='filter'),

    path('html_filter/', views.html_filter, name='html_filter'),

    path('diy_filter/', views.diy_filter, name='diy_filter'),

    path('diy_tags/', views.diy_tags, name='diy_tags'),

    path('show_info/', views.show_info, name='show_info'),

    path('welcome/', views.welcome, name='welcome'),

    path('test_static/', views.test_static, name='test_static'),
]
