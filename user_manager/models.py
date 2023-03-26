from django.db import models
from django.contrib.auth.models import User
from administration.models import City
from administration.models import DISTRICT
# Create your models here.

class Customer(models.Model):
    user = models.OneToOneField(User,on_delete=models.CASCADE , null=True,blank=True)
    district = models.CharField(max_length=20, default=DISTRICT.Kottayam, choices=DISTRICT.choices)
    profile_pic = models.ImageField(upload_to ="users/profile_pics/")
    address = models.TextField()
    city = models.ForeignKey(City,on_delete= models.CASCADE)
    mobile = models.CharField(max_length=12, unique=True)

class Shipping(models.Model):
    city = models.ForeignKey(City,on_delete= models.CASCADE)
    address_line_1 = models.TextField(null=False,blank=False)
    address_line_2 = models.TextField(null=True,blank=True)