from django.db import models


class GoodsCategory(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50, verbose_name='分类名称', default='')
    sort = models.IntegerField(verbose_name='排序')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '商品分类'
        db_table = 'd_goods_category9'


class Goods(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50, verbose_name='商品名称', default='')
    category = models.ForeignKey(GoodsCategory, verbose_name='商品分类', on_delete=models.DO_NOTHING)
    market_price = models.DecimalField(max_digits=8, decimal_places=2, verbose_name='市场价格')
    price = models.DecimalField(max_digits=8, decimal_places=2, verbose_name='实际价格')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '商品表'
        db_table = 'd_goods9'
