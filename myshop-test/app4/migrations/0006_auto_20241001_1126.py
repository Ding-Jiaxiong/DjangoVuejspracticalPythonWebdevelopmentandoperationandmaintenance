# Generated by Django 3.1.5 on 2024-10-01 11:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app4', '0005_auto_20241001_1120'),
    ]

    operations = [
        migrations.AlterField(
            model_name='skillinfo',
            name='user',
            field=models.ManyToManyField(db_table='user_skill', to='app4.UserBaseInfo'),
        ),
    ]
