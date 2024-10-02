import unittest

from calc import Calc
from calc_testcase import TestCalcMethod

# 创建测试套件
suit = unittest.TestSuite()
# 加载所有的测试类
suit.addTest(unittest.TestLoader().loadTestsFromTestCase(TestCalcMethod))
