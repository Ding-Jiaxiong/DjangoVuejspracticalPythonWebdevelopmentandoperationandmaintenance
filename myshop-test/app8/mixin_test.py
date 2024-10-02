class People():  # 父类
    def run(self):
        print("run")

    def talk(self):
        print("talk")


class DriverMixin(object):  # 功能类
    def driver(self):
        print("driver")


class Children(DriverMixin, People):  # 多继承
    pass


c = Children()
c.run()
c.talk()
c.driver()  # 自动拥有 Mixin 类的方法
