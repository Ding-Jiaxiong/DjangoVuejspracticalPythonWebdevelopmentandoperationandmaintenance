from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.db import connection, transaction
from django.db.models import F
from django.db import transaction
from django.db import connection
import json
from django.db.models import Q

from app5.forms import UserInfoForm, UserInfo_Msg_Form, ImgFileForm, UserBaseInfoModelForm
from app5.models import *
import django.utils.timezone as timezone
from django.shortcuts import render
from django.http import HttpResponse
import datetime
import os


# Create your views here.
def upload_file(request):
    if request.method == "GET":
        return render(request, "5/upload.html")
    # 请求方法为POST时，进行处理。文件上传为POST请求。
    if request.method == "POST":
        # 获取上传的文件，如果没有文件，则默认为None
        myFile = request.FILES.get("myfile", None)
        if myFile:
            # 二进制的写操作
            path = 'media/uploads/'
            if not os.path.exists(path):
                os.makedirs(path)
            dest = open(os.path.join(path + myFile.name), 'wb+')
            for chunk in myFile.chunks():  # 分块写入文件
                dest.write(chunk)
            dest.close()
            return HttpResponse("上传完成!")
        else:
            return HttpResponse("没有上传文件！")


def userinfo_form(request):
    if request.method == "GET":
        myform = UserInfoForm()
        return render(request, "5/userinfo.html", {'form_obj': myform})


def userinfo_msg_form(request):
    if request.method == "GET":
        myform = UserInfo_Msg_Form()
        return render(request, "5/userinfoform.html", {'form_obj': myform})
    else:
        f = UserInfo_Msg_Form(request.POST)
        if f.is_valid():
            print(f.clean())
            print(f.cleaned_data["username"])
            print(f.data)
        else:
            errors = f.errors
            print(errors)
            return render(request, "5/userinfoform.html", {'form_obj': f, 'errors': errors})
        return render(request, "5/userinfoform.html", {'form_obj': f})


def imgfileform(request):
    if request.method == "GET":
        f = ImgFileForm()
        return render(request, "5/upload_form.html", {'form_obj': f})
    else:
        f = ImgFileForm(request.POST, request.FILES)
        if f.is_valid():
            name = f.cleaned_data['name']
            headimg = f.cleaned_data['headimg']
            userimg = ImgFile()
            userimg.name = name
            userimg.headimg = headimg
            userimg.save()
            print("上传成功")
            return render(request, "5/upload_form.html", {'form_obj': f, 'user': userimg})


def userbaseinfo_modelform(request):
    if request.method == "GET":
        myform = UserBaseInfoModelForm()
        return render(request, "5/userinfoform.html", {'form_obj': myform})
    else:
        f = UserBaseInfoModelForm(request.POST)
        if f.is_valid():
            print(f.clean())
            print(f.cleaned_data["username"])
            print(f.data)

            # new_userinfo = f.save()

            user = f.save(commit=False)
            user.username = '手动name'
            user.save()

        else:
            errors = f.errors
            print(errors)
            return render(request, "5/userinfoform.html", {'form_obj': f, 'errors': errors})
        return render(request, "5/userinfoform.html", {'form_obj': f})


from django.views.decorators.csrf import csrf_exempt


# @csrf_exempt
def ajax_login(request):
    return render(request, "5/ajax_login.html")


# @csrf_exempt
def ajax_login_data(request):
    # 获取用户名和密码
    username = request.POST.get('username')
    password = request.POST.get('password')
    # 判断并返回json数据
    if username == 'admin' and password == '123456':
        return JsonResponse({'code': 1, "msg": "登陆成功"})
    else:
        return JsonResponse({'code': 0, "msg": "登陆失败"})
