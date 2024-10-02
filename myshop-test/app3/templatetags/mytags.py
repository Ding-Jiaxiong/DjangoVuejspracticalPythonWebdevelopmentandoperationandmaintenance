from django import template

register = template.Library()


@register.simple_tag
def show_title(value, n):
    if len(value) > n:
        return f'{value[0:n]}...'
    else:
        return value


@register.inclusion_tag("3\show_info_tags.html")
def show_info_tags():
    dict1 = {'标题': '张三|2020-02-02'}
    dict2 = {'标题': '李四|2020-02-01'}
    dict3 = {'标题': '王五|2020-01-31'}
    lists = [dict1, dict2, dict3]
    return {'lists': lists}
