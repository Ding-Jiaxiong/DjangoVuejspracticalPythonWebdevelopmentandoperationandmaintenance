import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'myshop.settings')
django.setup()

from app4.models import *

# one_user = UserExtraInfo.objects.get(id=1)
# one_user.salary = 30000.00
# one_user.save()

# one_user = UserExtraInfo.objects.filter(id=1).update(memo='他真的很帅')

users = UserExtraInfo.objects.update(status=1)
