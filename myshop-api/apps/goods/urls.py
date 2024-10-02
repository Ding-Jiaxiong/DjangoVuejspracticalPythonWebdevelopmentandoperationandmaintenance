from django.urls import path, include
from apps.goods import views
from rest_framework.routers import DefaultRouter

goods_list = views.GoodsCategoryViewset.as_view({'get': 'list', })

goods_detail = views.GoodsCategoryViewset.as_view({'get': 'retrieve', })

indexgoods = views.IndexCategoryGoodsViewSet.as_view({'get': 'list', })

router = DefaultRouter()
router.register('goods/goods', views.GoodsView)

router.register('slide', views.SlideViewset)

urlpatterns = [
    # GenericViewSet
    path('goods/goodscategory/', goods_list),
    path('goodscategory/<pk>/', goods_detail),
    path('indexgoods/', indexgoods),

    path("", include(router.urls))
]
