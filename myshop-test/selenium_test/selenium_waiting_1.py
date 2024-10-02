from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import os

cur_path = os.path.dirname(__file__)
filename = os.path.join(cur_path, "chromedriver.exe")
browser = webdriver.Chrome(filename)  # 声明浏览器
# 隐式等待:在查找所有元素时，如果尚未被加载，则等10秒
browser.implicitly_wait(10)
browser.get('https://www.baidu.com')
input_tag = browser.find_element_by_id('kw')
input_tag.send_keys('python')
input_tag.send_keys(Keys.ENTER)
# content_left属性在搜索结果页面，没有等待环节而直接查找，找不到则会报错
contents = browser.find_element_by_id('content_left')
print(contents.text)
browser.close()
