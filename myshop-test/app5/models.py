from django.db import models


# Create your models here.
class ImgFile(models.Model):
    name = models.CharField(verbose_name='名称', default='', max_length=30)
    headimg = models.FileField(verbose_name='文件名', upload_to="uploads/")

    def __str__(self):
        return str(self.name)

    class Meta:
        verbose_name = '用户头像信息'
        db_table = 'user_img'


class UserBaseInfo(models.Model):
    id = models.AutoField(verbose_name='编号', primary_key=True)
    username = models.CharField(verbose_name='用户名称', max_length=30)
    password = models.CharField(verbose_name='密码', max_length=10)
    age = models.IntegerField(verbose_name="年龄", default=1)
    mobile = models.CharField(verbose_name="手机号码", max_length=11)
    status = models.CharField(verbose_name='状态', max_length=1)
    createdate = models.DateTimeField(verbose_name='创建日期', db_column='createDate', auto_now=True)

    def __str__(self):
        return str(self.id)

    class Meta:
        managed = True
        verbose_name = '人员基本信息'
        db_table = 'UserBaseInfo5'
