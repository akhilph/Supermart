# Generated by Django 3.1.7 on 2021-04-10 09:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product_manager', '0001_initial'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Images',
            new_name='Image',
        ),
        migrations.AlterField(
            model_name='producttype',
            name='image',
            field=models.ImageField(null=True, upload_to='product/types/'),
        ),
    ]