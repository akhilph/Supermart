from django.forms import ModelForm
from .models import Product,ProductImage
from administration.models import Category as ProductType

class CreateProductTypeForm(ModelForm):
    class Meta:
        model = ProductType
        fields = '__all__'
        exclude = ['created_date']

class CreateProductForm(ModelForm):
    class Meta:
        model = Product
        fields = '__all__'
        exclude = ['created_date','images','modified_on']

class ProductImageUploadForm(ModelForm):
    class Meta:
         model=ProductImage
         fields= '__all__'