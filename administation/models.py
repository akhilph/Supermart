from django.db import models
from django.contrib.auth.models import User
from django.utils.translation import gettext_lazy as _
class DISTRICT(models.TextChoices):
        Alappuzha ='Alappuzha'
        Ernakulam ='Ernakulam'
        Idukki = 'Idukki',
        Kannur ='Kannur',
        Kasaragod = 'Kasaragod'
        Kollam = 'Kollam',
        Kottayam = 'Kottayam'
        Kozhikode = 'Kozhikode'
        Malappuram = 'Malappuram'
        Palakkad = 'Palakkad'
        Pathanamthitta ='Pathanamthitta'
        Thiruvananthapuram = 'Thiruvananthapuram'
class City(models.Model):
    class DELIVERABLE(models.TextChoices):
       NO = 'NO'
       YES ='YES'
    

    city = models.CharField(max_length=100, unique=True)
    district = models.CharField(max_length=20, default=DISTRICT.Kottayam, choices=DISTRICT.choices)
    pincode = models.IntegerField(null = False)
    deliverable = models.CharField(max_length=3,default= DELIVERABLE.YES, choices = DELIVERABLE.choices)
    def __str__(self):
        return self.city

    class Meta:
        ordering = ['city']
        unique_together = ('city', 'district','pincode')

class Category(models.Model):
    name = models.CharField(max_length=100, unique=True)
    caption = models.CharField(max_length=50)
    logo = models.ImageField(upload_to="category/")
    def __str__(self):
        return self.name

class Staff(models.Model):
    class Meta:
        db_table = 'staffs'
    user = models.OneToOneField(User,null=True,on_delete=models.CASCADE)
    avatar = models.ImageField(upload_to="staff/profile_pic/")
    district = models.CharField(max_length=20, default=DISTRICT.Kottayam, choices=DISTRICT.choices)
    city = models.ForeignKey(City,on_delete=models.CASCADE,null=True)
    address = models.TextField(_('Address'),max_length=200)
    mobile = models.CharField(max_length=10)

