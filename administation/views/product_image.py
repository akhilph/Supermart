from django.shortcuts import render,redirect,reverse,get_object_or_404
from django.http import HttpResponse,HttpResponseBadRequest
from product_manager.models import Product,ProductImage
from product_manager.forms import ProductImageUploadForm

def add_product_image(request,id):
    context = dict()
    context['product'] = product = get_object_or_404(Product,id=id)
    context['title'] = "Add {0} Images".format(product)
    if request.method =='POST':
       if product.productimage_set.count()>=6:
          return HttpResponseBadRequest("Can't upload more than 6 files")
       file =request.FILES.get('file')
       product_image = ProductImage(image=file,product=product)
       product_image.save()
       if(product.id):
         return HttpResponse(status=200)
       else:
         return HttpResponseBadRequest("Can't upload more files")
    return render(request,'administration/add_product_image.html',context)

def remove_product_image(request,id):
   image = get_object_or_404(ProductImage,id =id)
   image.delete()
   return HttpResponse(status=200)

def remove_all_product_images(request,id):
   product = get_object_or_404(Product,id=id)
   product.productimage_set.all().delete()
   return HttpResponse(status=200)
