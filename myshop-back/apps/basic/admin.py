from django.contrib import admin
from apps.basic.models import *


@admin.register(Address)
class AddressAdmin(admin.ModelAdmin):
    admin.site.site_title = "我的特产商城后台"
    admin.site.site_header = "我的特产商城后台"
    admin.site.index_title = "商城平台管理"
    # 设置列表中显示的字段
    # name="address"
    list_display = ['province', 'city', 'district', 'address', 'contact_name', 'contact_mobile']
    # verbose_name="配送地址管理"
    # 搜索
    search_fields = ['contact_name', 'contact_mobile']
    # 过滤
    list_filter = ['city']
