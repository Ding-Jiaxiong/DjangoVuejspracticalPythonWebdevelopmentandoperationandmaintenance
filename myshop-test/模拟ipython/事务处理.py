# import os
# import django
#
# os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'myshop.settings')
# django.setup()
#
# from django.db import transaction
#
# @transaction.atomic
# def trans(request):
#     # 开启事务
#     save_id = transaction.savepoint()
#     try:
#