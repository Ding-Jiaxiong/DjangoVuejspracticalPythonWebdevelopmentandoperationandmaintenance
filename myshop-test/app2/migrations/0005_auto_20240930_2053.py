# Generated by Django 3.1.5 on 2024-09-30 20:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app2', '0004_auto_20240930_2051'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userbaseinfo',
            name='createdate',
            field=models.DateTimeField(auto_created=True, verbose_name='创建日期'),
        ),
    ]
