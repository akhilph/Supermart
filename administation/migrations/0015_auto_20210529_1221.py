# Generated by Django 3.1.7 on 2021-05-29 06:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('administration', '0014_auto_20210529_1134'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='staff',
            name='city',
        ),
        migrations.AddField(
            model_name='staff',
            name='district',
            field=models.CharField(choices=[('Alappuzha', 'Alappuzha'), ('Ernakulam', 'Ernakulam'), ('Idukki', 'Idukki'), ('Kannur', 'Kannur'), ('Kasaragod', 'Kasaragod'), ('Kollam', 'Kollam'), ('Kottayam', 'Kottayam'), ('Kozhikode', 'Kozhikode'), ('Malappuram', 'Malappuram'), ('Palakkad', 'Palakkad'), ('Pathanamthitta', 'Pathanamthitta'), ('Thiruvananthapuram', 'Thiruvananthapuram')], default='Kottayam', max_length=20),
        ),
        migrations.AlterField(
            model_name='staff',
            name='address',
            field=models.TextField(max_length=200, verbose_name='Address'),
        ),
    ]
