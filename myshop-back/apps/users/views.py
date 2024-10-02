import json

from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.models import User
from django.contrib.auth import login, logout, authenticate
from apps.users.models import MyUser
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import F
import apps.users.models


def add(request):
    return render(request, 'shop/users/add.html')


def edit(request, id):
    print(id)
    return render(request, 'shop/users/edit.html')


def delete(request, id):
    obj = MyUser.objects.get(id=id)
    obj.delete()
    json_dict = {}
    json_dict["code"] = 200
    json_dict["msg"] = "删除数据成功"
    return JsonResponse(json_dict)


def index(request):
    if request.method == "GET":
        level = request.GET.get("level")
        truename = request.GET.get("truename", '')
        status = request.GET.get("status")

        # print("level", level)

        search_dict = dict()

        # if level == :
        #     search_dict['level'] = 4

        if level:
            search_dict["level"] = level
        # else:
        #     search_dict["level"] = None
        if truename:
            search_dict["truename"] = truename
        if status:
            search_dict["status"] = status

        datas = MyUser.objects.filter(**search_dict).order_by("-id")

        page_size = 2  # 每页显示的行数
        try:
            if not request.GET.get("page"):
                curr_page = 1
            curr_page = int(request.GET.get("page"))
        except:
            curr_page = 1

        paginator = Paginator(datas, page_size)
        try:
            users = paginator.page(curr_page)
        except PageNotAnInteger:
            users = paginator.page(1)
        except EmptyPage:
            users = paginator.page(1)
        context = {
            'level': level,
            'truename': truename,
            'status': status,
            'users': users,
        }
        print(context)
    return render(request, 'shop/users/index.html', context=context)


# 改进分页
def index_page(request):
    if request.method == "GET":
        page_size = 100  # 每页3条数据
        # page_size=int(request.GET["page_size"])
        try:
            if not request.GET["page"]:
                curr_page = 1
            curr_page = int(request.GET["page"])
        except:
            curr_page = 1
        # 获取总数count
        total = MyUser.objects.count()
        # 计算总页数
        total_page, remainder = divmod(total, page_size)
        if remainder:
            total_page += 1

        # 通过切片获取当前页和下一页的数据
        users = MyUser.objects.order_by("-id")[(curr_page - 1) * page_size:curr_page * page_size]
        return render(request, 'users/index_page.html',
                      {"users": users, "total_page": range(1, total_page + 1), "curr_page": curr_page})


def get_memberinfo(request):
    if request.method == "GET":
        page_size = 3
        curr_page = int(request.GET["page"])
        # 获取总数count
        total = models.MyUser.objects.count()
        # 通过切片获取当前页和下一页的数据
        users = models.MyUser.objects.order_by("-id")[(page_num - 1) * page_size:page_num * page_size]
        rows = []
        datas = {"total": total, "rows": rows}
        for user in users:
            rows.append({
                "id": user.id,
                "username": user.username,
                "truename": user.treuname,
            })
        return HttpResponse(json.dumps(datas), content_type="application/json")


def list(request):
    return render(request, 'users/list.html')


def index_bttable(request):
    return render(request, 'shop/users/index_bttable.html')


def ajax_member(request):
    total = MyUser.objects.count()
    users = MyUser.objects.order_by("-id")
    rows = []
    datas = {"total": total, "rows": rows}
    for user in users:
        rows.append({
            "id": user.id,
            "username": user.username,
            "truename": user.truename,
            "sex": user.sex,
            "email": user.email,
        })
    return JsonResponse(datas, safe=False, json_dumps_params={'ensure_ascii': False, "indent": 4})


def index1(request):
    if request.method == "GET":
        users = MyUser.objects.all().order_by("-id")
        context = {
            'users': users,
        }
    return render(request, 'shop/users/index.html', context=context)


def user_reg(request):
    if request.method == "GET":
        form_obj = forms.UserRegForm()
        return render(request, 'shop/user_reg.html', {"form_obj": form_obj})
    if request.method == "POST":
        form_obj = forms.UserRegForm(request.POST, request.FILES)
        if form_obj.is_valid():
            uname = request.POST.get("username", '')
            users = MyUser.objects.filter(username=uname)
            if users:
                for user in users:
                    user_img = user.user_img
                info = '用户已经存在'
            else:
                form_obj.cleaned_data.pop("re_password")
                form_obj.cleaned_data["is_staff"] = 1
                form_obj.cleaned_data["is_superuser"] = 0  # 非管理员
                # 接收页面传递过来的参数，进行用户新增
                user = MyUser.objects.create_user(**form_obj.cleaned_data)
                user_img = user.user_img
                info = '注册成功,请登陆'
            return render(request, 'shop/user_reg.html', {"form_obj": form_obj, "info": info, "user_img": user_img})
        else:
            errors = form_obj.errors
            print(errors)
            return render(request, "shop/user_reg.html", {'form_obj': form_obj, 'errors': errors})
        # return render(request,'shop/user_reg.html',{"form_obj":form_obj})


def user_login(request):
    return render(request, "shop/user_login.html")


def ajax_login_data(request):
    # if request.method=="POST":
    uname = request.POST.get("username", '')
    pwd = request.POST.get("password", '')
    json_dict = {}
    if uname and pwd:  ## 不为空的情况下，查询数据库
        if MyUser.objects.filter(username=uname):  # 判断用户是否存在
            # 如果存在，进行验证
            user = authenticate(username=uname, password=pwd)
            if user:  # 如果验证通过
                if user.is_active:  # 如果用户状态为激活
                    login(request, user)  # 进行登陆操作，完成session的设置
                    json_dict["code"] = 1000
                    json_dict["msg"] = "登陆成功"
                else:
                    json_dict["code"] = 1001
                    json_dict["msg"] = "用户还未激活"
            else:
                json_dict["code"] = 1002
                json_dict["msg"] = "账号密码不对，请重新输入"
        else:
            json_dict["code"] = 1003
            json_dict["msg"] = "用户账号有误，请查询"
    else:
        json_dict["code"] = 1004
        json_dict["msg"] = "用户名或者密码为空"
    return JsonResponse(json_dict)


from django.shortcuts import redirect


def diy_loginView(request):
    if request.method == "GET":
        return render(request, '6/login.html')
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
                    return redirect('/userbaseinfo_add')
                    # next=request.GET.get("next")
                    # if next:
                    #    print("http://"+request.get_host()+next)
                    #    return HttpResponseRedirect("http://"+request.get_host()+next)
                else:
                    info = "用户还未激活"
            else:
                info = "账号密码不对，请重新输入"
        else:
            info = '用户账号不存在，请查询'
        return render(request, '6/login.html', {"info": info})


from django.contrib.auth.decorators import login_required, permission_required
from apps.users import forms, models


@login_required
@permission_required("add_userbaseinfo")
def userbaseinfo_add(request):
    if request.method == "GET":
        return HttpResponse("进行新增操作")
    if request.method == "POST":
        # 接收数据
        # 保存
        pass
