from rest_framework import mixins
from rest_framework import generics
from app8.models import *
from app8.serializers import *


class GoodsView(generics.ListCreateAPIView):
    queryset = Goods.objects.all()
    serializer_class = GoodsSerializer


class GoodsDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Goods.objects.all()
    serializer_class = GoodsSerializer
