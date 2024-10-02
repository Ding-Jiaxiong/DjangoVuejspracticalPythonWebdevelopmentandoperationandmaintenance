from django.shortcuts import render, redirect

# Create your views here.
from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.decorators import login_required, permission_required
from django.urls import reverse
from django.views.decorators.cache import cache_page
from django.utils.decorators import method_decorator
from django.views import View

from app6.models import MyUser


def user_reg(request):
    if request.method == "GET":
        return render(request, '6/user_reg.html')
    if request.method == "POST":
        uname = request.POST.get("username", '')
        pwd = request.POST.get("password", '')
        if User.objects.filter(username=uname):
            info = '用户已经存在'
        else:
            d = dict(username=uname, password=pwd, email='111@111.com', is_staff=1, is_active=1, is_superuser=1)
            user = User.objects.create_user(**d)
            info = '注册成功,请登陆'
            # 跳转到登陆页面
            # return redirect(reverse("app6:user_login"))
        return render(request, '6/user_reg.html', {"info": info})


def user_login(request):
    if request.method == "GET":
        return render(request, '6/user_login.html')
    if request.method == "POST":
        uname = request.POST.get("username", '')
        pwd = request.POST.get("password", '')
        if User.objects.filter(username=uname):  # 判断用户是否存在
            # 如果存在，进行验证
            user = authenticate(username=uname, password=pwd)
            if user:  # 如果验证通过
                if user.is_active:  # 如果用户状态为激活
                    login(request, user)  # 进行登陆操作，完成session的设置
                    info = "登陆成功"
                else:
                    info = "用户还未激活"
            else:
                info = "账号密码不对，请重新输入"
        else:
            info = '用户账号不存在，请查询'
        return render(request, '6/user_login.html', {"info": info})


def myuser_reg(request):
    if request.method == "GET":
        return render(request, '6/user_reg.html')
    if request.method == "POST":
        uname = request.POST.get("username", '')
        pwd = request.POST.get("password", '')
        if MyUser.objects.filter(username=uname):
            info = '用户已经存在'
        else:
            d = dict(username=uname, password=pwd, email='222@111.com', is_staff=1, is_active=1, is_superuser=1,
                     weChat='yangcoder', level='1')
            user = MyUser.objects.create_user(**d)
            info = '注册成功,请登陆'
            # 跳转到登陆页面
            return redirect(reverse("app6_myuser_login"))


def myuser_login(request):
    if request.method == "GET":
        return render(request, '6/user_login.html')
    if request.method == "POST":
        uname = request.POST.get("username", '')
        pwd = request.POST.get("password", '')
        if MyUser.objects.filter(username=uname):  # 判断用户是否存在
            # 如果存在，进行验证
            user = authenticate(username=uname, password=pwd)
            if user:  # 如果验证通过
                if user.is_active:  # 如果用户状态为激活
                    login(request, user)  # 进行登陆操作，完成session的设置
                    info = "登陆成功"
                    return redirect(reverse("app6_user_index"))
                    # return render(request,"6/user_index.html")
                else:
                    info = "用户还未激活"
            else:
                info = "账号密码不对，请重新输入"
        else:
            info = '用户账号不存在，请查询'
        return render(request, '6/user_login.html', {"info": info})


def myuser_logout(request):
    logout(request)
    return redirect(reverse("app6_myuser_login"))


@permission_required("app6.view_myuser")
@login_required
def user_index(request):
    users = MyUser.objects.all()
    return render(request, '6/user_index.html', {"users": users})


@permission_required("app6.change_myuser")
@login_required
def myuser_edit(request):
    return render(request, '6/user_edit.html')


def test(request):
    return HttpResponse("我也执行了")


@cache_page(60 * 1)  # 缓存1分钟
def index(request):
    users = MyUser.objects.all()
    return render(request, '6/user_index.html', {"users": users})


@method_decorator(cache_page(60 * 1), name="get")
class CachePage(View):
    @method_decorator(cache_page(60 * 1))
    def get(self, request):
        users = MyUser.objects.all()
        return render(request, '6/user_index.html', {"users": users})
