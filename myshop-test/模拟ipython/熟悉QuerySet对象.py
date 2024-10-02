import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'myshop.settings')
django.setup()

from app4.models import *

# users = UserExtraInfo.objects.all()
# print(users[0].truename)
#
#
# users = UserExtraInfo.objects.filter(sex=1)
# for user in users:
#     print(user.truename)
#
# print(type(users))

# user = UserExtraInfo.objects.get(id=1)
# print(user, type(user))

# users = UserExtraInfo.objects.exclude(age__lt=23)
# print(users[0].truename)

# users = UserExtraInfo.objects.values()
# for user in users:
#     print(user)
#
# users = UserExtraInfo.objects.values('id', 'username')
# for user in users:
#     print(user)

users = UserExtraInfo.objects.distinct().values('department')
print(users)
