# Generated by Django 4.2.16 on 2024-10-01 17:50

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("users", "0002_alter_myuser_id"),
    ]

    operations = [
        migrations.AddField(
            model_name="myuser",
            name="nickname",
            field=models.CharField(blank=True, max_length=50, verbose_name="昵称"),
        ),
    ]
