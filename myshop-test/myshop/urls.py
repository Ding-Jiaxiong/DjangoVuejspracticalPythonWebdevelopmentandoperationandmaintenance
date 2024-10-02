"""myshop URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.contrib import admin
from django.urls import path, include, re_path
from django.views.static import serve
from rest_framework.authtoken.views import obtain_auth_token

from rest_framework.documentation import include_docs_urls
from rest_framework_jwt.views import obtain_jwt_token

# from rest_framework.schemas import get_schema_view

from app1 import views

urlpatterns = [
    path('admin/', admin.site.urls),

    path("index/", views.index, name='index'),

    path("", include('app1.urls')),
    path("", include('app2.urls')),
    path("", include('app3.urls')),
    path("", include('app4.urls')),
    path("", include('app5.urls')),
    path("", include('app6.urls')),

    path("", include("app8.urls")),

    path("docs/", include_docs_urls(title='myshop 接口文档', description='Author: Ding Jiaxiong')),

    re_path('media/(?P<path>.*)', serve, {'document_root': settings.MEDIA_ROOT}),
    re_path('static/(?P<path>.*)', serve, {'document_root': settings.STATIC_ROOT}),

    path('api-token-auth/', obtain_auth_token),

    path('api-jwt-token-auth/', obtain_jwt_token),
]
