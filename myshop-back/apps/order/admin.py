from django.contrib import admin
from apps.order.models import *


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    # 设置列表中显示的字段
    list_display = ['order_sn', 'order_total', 'order_price', 'memo']


@admin.register(OrderGoods)
class OrderGoodsAdmin(admin.ModelAdmin):
    # 设置列表中显示的字段
    list_display = ['goods_id', 'goods_num', 'price']


@admin.register(Cart)
class CartAdmin(admin.ModelAdmin):
    # 设置列表中显示的字段
    list_display = ['goods_id', 'user_id', 'goods_num']
