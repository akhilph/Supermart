from django.shortcuts import get_object_or_404
from django.db import models
from django.utils.translation import gettext_lazy as _

from product_manager.models import Product
from django.contrib.auth.models import User

class Order(models.Model):
    customer_mobile = models.CharField(_("Customer Mobile Number"),max_length=10)
    order_date = models.DateTimeField(auto_now_add=True)
    order_total_price = models.FloatField(_("Total"), default=0)

    def __str__(self):
        return self.customer_mobile
    class Meta:
        ordering = ['-order_date']
class OrderItems(models.Model):
   order = models.ForeignKey(Order,on_delete=models.CASCADE)
   product_name = models.CharField(max_length=200)
   product = models.ForeignKey(Product,null=True,on_delete=models.SET_NULL)
   unit_price= models.FloatField(_("Unit Price"))
   count = models.IntegerField()
   price = models.FloatField()
   def __str__(self):
        return self.product_name
   def fill_details(self):
       product = get_object_or_404(Product,id=self.product.id)
       self.product_name = product.name
       self.unit_price = product.price

class Review(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE, null=True,blank=True)
    product= models.ForeignKey(Product,on_delete=models.CASCADE)
    title = models.CharField(max_length=100)
    picture= models.ImageField(upload_to='review/photos',null=True,blank=True)
    rating = models.FloatField()
    review = models.TextField()
    reviewed_dt = models.DateTimeField(auto_now_add=True)
    reviewed_dt = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.title
    class Meta:
        unique_together = ['product', 'user']

class OnlineOrder(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    order_dt = models.DateTimeField(auto_now_add= True)
    shipping_address = models.TextField()
    billing_address = models.TextField()
    grandtotal = models.FloatField()
    is_shipped = models.BooleanField(default=False)
    class Meta:
        ordering = ['-order_dt']

class OnlineOrderItems(models.Model):
    order = models.ForeignKey(OnlineOrder,on_delete=models.CASCADE)
    product = models.ForeignKey(Product,on_delete=models.SET_NULL, blank=True,null= True)
    product_name = models.CharField(max_length=200)
    uprice = models.FloatField()
    quanitiy = models.IntegerField()
    totalprice = models.FloatField()

    def __str__(self):
        return self.product_name

class Query(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    image = models.ImageField(upload_to ='query/',null=True,blank=True)
    description = models.TextField()

class Complaint_query(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    image = models.ImageField(upload_to ='complaint_query/',null=True,blank=True)
    description = models.TextField()
    
