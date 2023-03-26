from django.shortcuts import render,redirect,reverse,get_object_or_404
from django.contrib import messages
from django.http import HttpResponse
from product_manager.forms import CreateProductForm
from product_manager.models import Product

def add_product(request):
    context = dict()
    context['title'] = 'Add Product'
    context['form']=CreateProductForm()
    if request.method=='POST':
        form=CreateProductForm(data=request.POST,files=request.FILES)
        if form.is_valid():
            product = form.save()
            messages.info(request,"Successfully Saved.")
            return redirect(reverse('admin:product.image.list',args=[product.id]))
        else:
            messages.info(request,"Invalid Inputs")
            context['form']= form
    return render(request,'administration/add_product.html',context)

def existing_product(request):
    context = dict()
    context['title']='products'
    context['products'] = Product.objects.all()
    return render(request,'administration/list_product.html',context)
    
def edit_product(request,id):
    context = dict()
    context['title'] = 'Edit Product Details'
    context['form'] = CreateProductForm(instance=get_object_or_404(Product,id=id))
    if request.method == 'POST':
        form = CreateProductForm(instance=get_object_or_404(Product,id=id),data=request.POST)
        if form.is_valid():
            form.save()
            return redirect(reverse('admin:product.list'))
        else:
            context['form'] = form
  
    return render(request,'administration/add_product.html',context)

def delete_product(request,id):
    product= get_object_or_404(Product,id=id)
    product.delete()
    messages.info(request,"Product:{0} & Its items are deleted.. ".format(product))
    return redirect(reverse('admin:product.list'))



