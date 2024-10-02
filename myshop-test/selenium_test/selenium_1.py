import time

from selenium import webdriver
import os

# op = webdriver.ChromeOptions()
# op.add_experimental_option('detach', True)

# cur_path = os.path.dirname(__file__)
# filename = os.path.join("chromedriver.exe")
browser = webdriver.Chrome()  # 声明浏览器



url = 'https://www.baidu.com'
browser.get(url)  # 打开浏览器预设网址
print(browser.page_source)  # 打印网页源代码

time.sleep(10)

# while True:
#     pass

# browser.close()#关闭浏览器
