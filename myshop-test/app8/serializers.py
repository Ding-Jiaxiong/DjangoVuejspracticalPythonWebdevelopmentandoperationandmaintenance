from rest_framework import serializers
from .models import *


class GoodsCategorySerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    name = serializers.CharField()


class GoodsSerializer(serializers.Serializer):
    name = serializers.CharField(required=True, max_length=100)
    category = serializers.CharField(required=False)  # GoodsCategorySerializer()
    # category = GoodsCategorySerializer(required=False, read_only=True)
    market_price = serializers.DecimalField(max_digits=8, decimal_places=2)
    price = serializers.DecimalField(max_digits=8, decimal_places=2)

    # post_category = serializers.IntegerField(write_only=True)

    def create(self, validated_data):
        print(type(validated_data), validated_data)
        # validated_data['category_id']=validated_data.get('post_category')
        # goods_obj = Goods.objects.create(
        #    name=validated_data.get('name'),
        #    market_price=validated_data.get('market_price'),
        #    price=validated_data.get('price'),
        #    category_id=validated_data.get('post_category'),
        # )
        return Goods.objects.create(**validated_data)

    def update(self, instance, validated_data):
        print(type(validated_data), validated_data)
        instance.name = validated_data.get("name")
        instance.market_price = validated_data.get("market_price")
        instance.price = validated_data.get("price")
        instance.save()
        return instance


class GoodsCategoryModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = GoodsCategory
        fields = "__all__"


class GoodsModelSerializer(serializers.ModelSerializer):
    # category=serializers.CharField()
    category = GoodsCategoryModelSerializer()

    class Meta:
        model = Goods  # 关联模型类
        fields = "__all__"  # 显示所有的字段
        # fields=('id','name','category','market_price','price')
