import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'myshop.settings')
django.setup()

import django.utils.timezone as timezone
from app4.models import *

# depart = DepartInfo()
# depart.departname = '产品部'
# depart.createdate = timezone.now()
# depart.save()

d = dict(username='张三', password='123456', status=1, createdate=timezone.now())
user = UserBaseInfo.objects.create(**d)
