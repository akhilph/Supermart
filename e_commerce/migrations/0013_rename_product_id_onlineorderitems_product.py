# Generated by Django 3.2 on 2021-06-06 12:32

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('e_commerce', '0012_onlineorderitems_uprice'),
    ]

    operations = [
        migrations.RenameField(
            model_name='onlineorderitems',
            old_name='product_id',
            new_name='product',
        ),
    ]
