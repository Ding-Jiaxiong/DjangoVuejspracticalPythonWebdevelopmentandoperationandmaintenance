from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait  # 等待页面加载某些元素
import os, time
from selenium.webdriver.support.select import Select
import unittest
import random


class TestPage(unittest.TestCase):
    def setUp(self):
        self.cur_path = os.path.dirname(__file__)
        self.filename = os.path.join(self.cur_path, "chromedriver.exe")
        self.driver = webdriver.Chrome(self.filename)  # 声明浏览器
        # self.driver.implicitly_wait(2)

    def test_goodscategory_add(self):
        # 访问商城后台
        self.driver.get('http://localhost:8000/admin')
        time.sleep(5)  # 暂停5秒，使得登录页面加载完成。
        try:
            # 获取用户名输入框
            username = self.driver.find_element_by_name("username").send_keys("dingding")
            # 获取密码输入框
            password = self.driver.find_element_by_name("password").send_keys("12345678")
            # 发送一个回车键
            login = self.driver.find_element_by_xpath('//input[@value="登录"]')
            login.click()
            time.sleep(2)
            assert "站点管理" in self.driver.page_source
            time.sleep(2)

            # 点击商品分类中增加的链接
            add = self.driver.find_element_by_xpath('//*[@id="content-main"]/div[1]/table/tbody/tr[1]/td[1]/a')
            add.click()
            time.sleep(2)
            assert "增加 商品分类" in self.driver.page_source

            # 输入分类名称
            self.driver.find_element_by_name("name").send_keys('新疆特级大枣')
            # 选择父类
            select_element = Select(self.driver.find_element_by_xpath('//select'))
            select_element.select_by_visible_text("程序类")
            print(select_element.all_selected_options[0].text)
            self.assertEqual(select_element.all_selected_options[0].text, "程序类")
            # 上传文件
            file = self.driver.find_element_by_id("id_logo")
            file.send_keys("d:\\test.jpg")
            # 输入排序
            sort = self.driver.find_element_by_name("sort").send_keys('5')
            time.sleep(2)
            # 点击保存按钮
            self.driver.find_element_by_name("_save").send_keys(Keys.ENTER)
        except AssertionError as e:
            print(f'测试异常为{e}' + '\n')
            savescreen(self.driver)
            raise e
        except Exception as e:
            savescreen(self.driver)
            print(e)

    def tearDown(self):
        self.driver.quit()


def savescreen(driver):
    cur_path = os.path.dirname(__file__)
    filename = os.path.join(cur_path, str(random.randint(0, 1000000)) + ".png")
    try:
        driver.get_screenshot_as_file(filename)
    except Exception as e:
        print(e)


if __name__ == '__main__':
    unittest.main()
