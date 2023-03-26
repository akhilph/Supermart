
from django.db import models
from django.utils.translation import gettext_lazy as _
from administration.models import Category

# Create your models here.

class Product(models.Model):
    class Meta:
        db_table = 'Products'
    class UNIT_OF_MEASURES(models.TextChoices):
        PACKET = 'PACKET', 
        BOTTLE = 'BOTTLE'
        KG = 'KG'
        GRAM = 'GRAM'
        LITER = 'LITER'
        ML = 'ML'
    name = models.CharField(max_length=100)
    sku = models.CharField(max_length=50,unique=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    reorder_lvl = models.IntegerField()
    unit_of_measure  = models.CharField(
        max_length=10,
        choices=UNIT_OF_MEASURES.choices,
        default=UNIT_OF_MEASURES.PACKET
        )
    created_date = models.DateTimeField(auto_now_add=True)
    modified_on = models.DateTimeField(auto_now=True,null=True)
    stock = models.IntegerField()
    tags = models.CharField(max_length = 250,null=False)
    price = models.FloatField(default=0)
    def __str__(self):
        return self.name
    
class ProductImage(models.Model):
    class Meta:
        db_table = 'ProductImages'
    image = models.ImageField(upload_to ="product/images/",null=True,blank=True)
    product = models.ForeignKey(Product,on_delete=models.CASCADE,null=True,blank=True)
    def __str__(self):
        return self.image.url

