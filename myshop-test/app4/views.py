from django.utils import timezone

from django.db import transaction
from django.shortcuts import render

from app4.models import UserBaseInfo, UserExtraInfo
from django.http import HttpResponse


# Create your views here.
@transaction.atomic
def userinfo_trans(request):
    # 开启事务
    save_id = transaction.savepoint()
    try:
        # 基本信息保存
        d = dict(username="测试12", password='123456', status=1,
                 createdate=timezone.now())
        userbaseinfo = UserBaseInfo.objects.create(**d)
        # raise  # 抛出异常
        # 扩展信息保存
        d = dict(username="测试12", truename='测试1', sex=0, salary=6555.88, age=35,
                 status=0, createdate=timezone.now(), memo='', user=userbaseinfo, depart_id=3)
        userextrainfo = UserExtraInfo.objects.create(**d)
        transaction.savepoint_commit(save_id)
        msg = "新增数据成功"
        print(msg)
    except:
        transaction.savepoint_rollback(save_id)
        msg = "新增数据失败"
        print(msg)
    return HttpResponse(msg)
