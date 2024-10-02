from django.contrib import admin
from apps.goods.models import *


@admin.register(GoodsCategory)
class GoodsCategoryAdmin(admin.ModelAdmin):
    admin.site.site_title = "我的特产商城后台"
    admin.site.site_header = "我的特产商城后台"
    admin.site.index_title = "商城平台管理"
    # 设置列表中显示的字段
    list_display = ['name', 'logo', 'sort', 'create_time']
    # 搜索
    search_fields = ['name']
    # 过滤
    list_filter = ['name', 'parent_id']
    # 设置日期选择器
    date_hierarchy = 'create_time'
    # 设置每页现实的数据量
    list_per_page = 10
    # 设置排序
    ordering = ['sort']


@admin.register(Goods)
class GoodsAdmin(admin.ModelAdmin):
    # 设置列表中显示的字段
    list_display = ['name', 'market_price', 'price']


@admin.register(Slide)
class SlideAdmin(admin.ModelAdmin):
    # 设置列表中显示的字段
    list_display = ['goods_id', 'sort', 'images']
