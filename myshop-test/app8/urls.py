from django.contrib import admin
from django.urls import path, include
from django.views.static import serve
from django.conf import settings

from rest_framework.routers import DefaultRouter

from app8 import views, views_api_view, views_apiview, views_mixins, views_generics, views_viewset

# goods_list = views_viewset.GoodsViewSet.as_view({
#     'get': 'list',
# })
#
# goods_detail = views_viewset.GoodsViewSet.as_view({
#     'get': 'retrieve',
# })

router = DefaultRouter()
router.register('goods5', views_viewset.GoodsViewSet)
router.register('goods_all', views_viewset.GoodsView)

router.register('goods_custom', views_viewset.GoodsView_Custom, basename="goods_custom")

urlpatterns = [

    # ModelViewSet
    path("app8/", include(router.urls)),

    # # GenericViewSet
    # path('app8/goods5/', goods_list),
    # path('app8/goods5/<pk>/', goods_detail),

    # path('app8/goods5/', views_viewset.GoodsViewSet.as_view({
    #     'get': 'list',
    # })),
    # path('app8/goods5/<pk>', views_viewset.GoodsViewSet.as_view({
    #     'get': 'retrieve',
    # })),

    path('app8/goods/index/', views.GoodsListView.as_view()),

    path('app8/goods/', views.GoodsView.as_view()),

    # @api_view装饰器
    path('app8/goods1/', views_api_view.GoodsList),
    path('app8/goods1/<id>/', views_api_view.GoodsList),

    # ApiView视图
    path('app8/goods2/', views_apiview.GoodsView.as_view()),
    path('app8/goods2/<id>/', views_apiview.GoodsView.as_view()),

    # mixins
    path('app8/goods3/', views_mixins.GoodsView.as_view()),
    path('app8/goods3/<pk>/', views_mixins.GoodsDetailView.as_view()),

    # generics
    path('app8/goods4/', views_generics.GoodsView.as_view()),
    path('app8/goods4/<pk>/', views_generics.GoodsDetailView.as_view()),

]
