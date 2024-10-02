from django.urls import path, include, re_path
from django.views.static import serve

from app5 import views
from myshop import settings

urlpatterns = [

    path('app5/upload_file/', views.upload_file, name='upload_file'),

    path('userinfoform/', views.userinfo_form, name='userinfo_form'),

    path('userinfomsgform/', views.userinfo_msg_form, name='userinfo_msg_form'),

    path('userimg/', views.imgfileform, name='imgfileform'),

    re_path('media/(?P<path>.*)', serve, {"document_root": settings.MEDIA_ROOT}),

    path('userinfomodelform/', views.userbaseinfo_modelform, name='userbaseinfo_modelform'),

    path('ajax_login/', views.ajax_login, name='ajax_login'),
    path('ajax_login_data/', views.ajax_login_data, name='ajax_login_data'),
]
