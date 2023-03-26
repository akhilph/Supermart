from django.shortcuts import render,redirect
from django.urls import reverse
from django.http import JsonResponse
from django.core import serializers
from django.http.response import HttpResponse
from django.shortcuts import render,get_object_or_404
from product_manager.models import Product
from e_commerce.models import Order,OrderItems,OnlineOrder
import json


def order_dashboard(request):
    context = dict()
    context['title'] ='Order Management'
    return render(request,'staff/order-dashboard.html',context)

def new_order(request):
    context = dict()
    context['title'] = 'New Order Details'
    context['products'] = Product.objects.filter(stock__gt=0).all()
    return render(request,'staff/new-order.html',context)

def get_product_details(request):
    id = request.POST.get('id')
    product = get_object_or_404(Product,id=id)
    data = dict({"id":product.id,"name":product.name,"price":product.price,"stock":product.stock})
    return JsonResponse(data) 

def place_order(request):
    if request.method == 'POST':
        order_details = json.loads(request.body)
        order = Order(customer_mobile=order_details['mobile'], order_total_price=order_details['grand_total'])
        order.save()
        for item in order_details['items']:
            orderitem = OrderItems(
                order_id = order.id,
                product_name=item['product'],
                product_id = item['id'],
                unit_price = item['uprice'],
                count      = item['count'],
                price      = item['total']
            )
            product = get_object_or_404(Product,id=item['id'])
            product.stock = product.stock-orderitem.count
            product.save()
            orderitem.save()

        return redirect(reverse('staff:order.receipt',args=[order.id]))

def order_receipt(request,id):
    context = dict()
    context['title'] = 'Order Recept'
    context['order'] = get_object_or_404(Order,id=id)

    return render(request,'staff/receipt.html',context)

def view_online_orders(request):
    context = dict()
    context['title'] = 'Pending online orders'
    context['orders'] = OnlineOrder.objects.filter(is_shipped=False).all()
    return render(request,'staff/online-orders.html',context)

def online_order_details(request,id):
    context = dict()
    context['title'] = "Order Details"
    context['order'] = get_object_or_404(OnlineOrder,id=id)
    return render(request,'staff/oorder_details.html',context)

def update_shipping_details(request,id):
    order = get_object_or_404(OnlineOrder,id=id)
    order.is_shipped = True
    order.save()
    return HttpResponse(status=200)

def online_order_history(request):
    context = dict()
    context['title'] = 'Online Order History'
    context['orders'] = OnlineOrder.objects.filter(is_shipped=True).all()
    return render(request,'staff/order/order_history.html',context)