from product_manager.models import Product
from django.shortcuts import get_object_or_404,redirect,reverse,render
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth import update_session_auth_hash
from django.contrib import messages
from e_commerce.models import Order
from django.http import HttpResponse
import json

def dashboard(request):
    context = dict()
    context['title'] = "Staff Dashboard"
    return render(request,'staff/dashboard.html',context)

def change_password(request):
    context = dict()
    context['title'] = 'Change Password'
    form= PasswordChangeForm(request.user,data=request.POST or None)
    if request.method =='POST':
        if form.is_valid():
           user = form.save()
           update_session_auth_hash(request, user)  
           messages.success(request, 'Your password was successfully updated!',extra_tags='success')
           return redirect(reverse('staff:dashboard'))
    context['form'] = form
    return render(request,'staff/change-password.html',context)
    
def manage_profile():
    pass

def order_history(request):
    context = dict()
    context['title'] = 'Order History'
    context['orders'] = Order.objects.all()
    return render(request,'staff/dashboard/order_history.html',context)

def stock_verification(request):
    context = dict()
    context['title'] = 'Stock verification'
    context['products'] = Product.objects.all()
    return render(request,'staff/dashboard/stock_verification.html',context)

def stock_updation(request):
    context = dict()
    context['title'] = 'Stock updation'
    context['products'] = Product.objects.all()
    return render(request,'staff/dashboard/stock_updation.html',context)

def stock_blk_update(request):
    products_info = json.loads(request.body)
    products = list()
    for product_info in products_info:
        product = get_object_or_404(Product,id=product_info['id'])
        product.stock=product_info['stock']
        products.append(product)
    Product.objects.bulk_update(products, ['stock'])
    return HttpResponse('All stocks are updated..')
