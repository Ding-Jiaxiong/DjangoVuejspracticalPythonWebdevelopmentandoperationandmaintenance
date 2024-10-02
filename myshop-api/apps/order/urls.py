from django.contrib import admin
from django.urls import path, include
from rest_framework.routers import DefaultRouter

from apps.order import views

router = DefaultRouter()
router.register('cart', views.CartViewset, basename="cart")

urlpatterns = [
    path("", include(router.urls)),

    path('order/', views.OrderView.as_view()),  # get，Post
]
