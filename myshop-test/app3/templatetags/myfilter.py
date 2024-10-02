from django import template

register = template.Library()


@register.filter
def show_title(value, n):
    if value.__len__() > n:
        return f'{value[0:n]}...'
    else:
        return value
