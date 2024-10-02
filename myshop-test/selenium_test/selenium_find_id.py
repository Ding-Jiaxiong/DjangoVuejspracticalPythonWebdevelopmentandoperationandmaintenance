from selenium import webdriver
import os

cur_path = os.path.dirname(__file__)
# filename = os.path.join(cur_path, 'chromedriver_win32_83.0.4103.39', "chromedriver.exe")
browser = webdriver.Chrome()  # 声明浏览器
url = 'https://www.jd.com/'
browser.get(url)  # 打开浏览器预设网址
cata_text = browser.find_element_by_id("J_cate")
print(cata_text.text)
print('*********')
cata_names = browser.find_elements_by_class_name("cate_menu_item")
for x in cata_names:
    print(x.text)
browser.close()  # 关闭浏览器
