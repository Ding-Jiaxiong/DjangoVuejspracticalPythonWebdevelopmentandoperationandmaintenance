from rest_framework import permissions
from rest_framework_jwt.authentication import jwt_decode_handler


# from rest_framework_jwt.authentication import jwt_decode_handler


class IsOwnerOrReadOnly(permissions.BasePermission):
    """
    对象级权限仅允许对象的所有者对其进行编辑
    """

    def has_permission(self, request, view):
        print(request)
        print(view)
        print(request.user.username)
        if request.user.username == "admin":
            return True

    def has_object_permission(self, request, view, obj):
        token = request.META['HTTP_AUTHORIZATION'][5:]
        token_user = jwt_decode_handler(token)
        print(token_user)
        print(obj.user.id)
        if token_user:
            return obj.user.id == token_user['user_id']
        return False
