from django.contrib import admin
from django.urls import path, include, re_path
from apps.users import views
from django.views.static import serve
from myshop import settings

urlpatterns = [
    path('user_reg/', views.user_reg),
    path('user_login/', views.user_login),
    path('ajax_login_data/', views.ajax_login_data),
    # path('diy_reg',views.diy_reg),
    path('diy_login/', views.diy_loginView),
    path('userbaseinfo_add', views.userbaseinfo_add),

    path('index/', views.index),
    path('add/', views.add),
    path('edit/<id>/', views.edit),
    path('del/<id>/', views.delete),
    path('index_page', views.index_page),
    path("list", views.list),
    path("index_bttable/", views.index_bttable),
    path("ajax_member/", views.ajax_member),
]
