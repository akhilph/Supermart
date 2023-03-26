# Generated by Django 3.2 on 2021-05-13 02:37

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('administration', '0011_delete_product'),
        ('product_manager', '0003_auto_20210411_1857'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='product',
            name='ptype',
        ),
        migrations.AddField(
            model_name='product',
            name='category',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='administration.category'),
            preserve_default=False,
        ),
        migrations.DeleteModel(
            name='ProductType',
        ),
    ]