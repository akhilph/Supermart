# Generated by Django 3.1.7 on 2021-05-28 13:30

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('product_manager', '0006_auto_20210528_1858'),
    ]

    operations = [
        migrations.AlterModelTable(
            name='product',
            table='Products',
        ),
        migrations.AlterModelTable(
            name='productimage',
            table='ProductImages',
        ),
    ]