# Generated by Django 3.1.7 on 2021-05-29 06:59

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('administration', '0015_auto_20210529_1221'),
    ]

    operations = [
        migrations.AddField(
            model_name='staff',
            name='city',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='administration.city'),
        ),
    ]