# from rest_framework import filters
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets, permissions, mixins
# from rest_framework import mixins
from rest_framework.filters import SearchFilter, OrderingFilter

from app8.custommodelviewset import CustomModelViewSet
# from app8.models import *
from app8.myfilter import GoodsFilter
from app8.mypage import MyPage
from app8.serializers import *
from common.permissions import IsOwnerOrReadOnly

from rest_framework_extensions.cache.mixins import CacheResponseMixin


class GoodsView(CacheResponseMixin, viewsets.ModelViewSet):
    """
    list:
        返回所有数据.
    retrieve:
        返回单条数据实例.
    """
    queryset = Goods.objects.all()
    serializer_class = GoodsSerializer

    pagination_class = MyPage
    filter_backends = (DjangoFilterBackend, SearchFilter, OrderingFilter)  # 指定过滤器的配置类
    # filterset_fields = ('name', 'price')  # 过滤字段
    filterset_class = GoodsFilter
    search_fields = ('name', 'price')

    ordering_fields = ('id', 'name', 'price')

    # permission_classes = (permissions.IsAuthenticated, IsOwnerOrReadOnly)


class GoodsViewSet(mixins.ListModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
    list:
        返回所有数据.
    retrieve:
        返回单条数据实例.
    """
    queryset = Goods.objects.all()
    serializer_class = GoodsSerializer
    permission_classes = (permissions.IsAuthenticated, IsOwnerOrReadOnly)


class GoodsView_Custom(CustomModelViewSet):
    queryset = Goods.objects.all()
    serializer_class = GoodsSerializer
    pagination_class = MyPage

    permission_classes = (permissions.IsAuthenticated, IsOwnerOrReadOnly)
    # filter_backends = (DjangoFilterBackend,)

    # filter_backends = (DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter)
    #
    # # filter_fields = ('name', 'price')
    # filterset_class = GoodsFilter
    # # permission_classes=(permissions.IsAuthenticated,IsOwnerOrReadOnly)
    # # 搜索
    # # filter_backends = (DjangoFilterBackend, filters.SearchFilter)
    # search_fields = ('name', 'price')
    # # 排序
    #
    # ordering_fields = ('id', 'name', 'price')
