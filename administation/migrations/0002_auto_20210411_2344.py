# Generated by Django 3.1.7 on 2021-04-11 18:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('administration', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='city',
            name='city',
            field=models.CharField(max_length=100, unique=True),
        ),
    ]
