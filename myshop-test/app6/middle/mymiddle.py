# 中间件需要继承MiddlewareMixin
from django.utils.deprecation import MiddlewareMixin
from django.http import HttpResponse


class AuthMiddleware1(MiddlewareMixin):
    def process_request(self, request):
        print("process_request1()方法执行")
        # return HttpResponse("返回")

    def process_view(self, request, callback, callback_args, callback_kwargs):
        print("process_view1()方法执行")

    def process_template_response(self, request, response):
        print("process_template_response1()方法执行")
        return response

    def process_exception(self, request, exception):
        print("process_exception1()方法执行")

    def process_response(self, request, response):
        print("process_response1()方法执行,状态为", response.reason_phrase)
        return response


class AuthMiddleware2(MiddlewareMixin):
    def process_request(self, request):
        print("process_request2()方法执行")

    def process_view(self, request, callback, callback_args, callback_kwargs):
        print("process_view2()方法执行")

    def process_template_response(self, request, response):
        print("process_template_response2()方法执行,用的很少,不做测试")
        return response

    def process_exception(self, request, exception):
        print("process_exception2()方法执行")

    def process_response(self, request, response):
        print("process_response2()方法执行,状态为", response.reason_phrase)
        return response
