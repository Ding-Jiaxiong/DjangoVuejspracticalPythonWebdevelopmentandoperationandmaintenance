from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait  # 等待页面加载某些元素
import os

cur_path = os.path.dirname(__file__)
filename = os.path.join(cur_path, "chromedriver.exe")
browser = webdriver.Chrome(filename)  # 声明浏览器
browser.get('https://www.baidu.com')
input_tag = browser.find_element_by_id('kw')
input_tag.send_keys('python')
input_tag.send_keys(Keys.ENTER)
# 显式等待：显式地等待某个元素被加载
wait = WebDriverWait(browser, 10)
wait.until(EC.presence_of_element_located((By.ID, 'content_left')))
# content_left属性在搜索结果页面，没有等待环节而直接查找，找不到则会报错
contents = browser.find_element(By.ID, 'content_left')
print(contents.text)
browser.close()
