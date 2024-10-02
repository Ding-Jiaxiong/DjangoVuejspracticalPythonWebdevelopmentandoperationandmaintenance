from django.test import TestCase
from app9.models import Goods


class TestGoodModel(TestCase):

    def setUp(self):
        self.good = Goods.objects.create(name='大枣', market_price=99, price=89, category_id=1)

    def test_goodmodel(self):
        good = Goods.objects.get(id=self.good.id)
        self.assertEqual(good.price, 89)
