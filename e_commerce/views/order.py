from typing import OrderedDict
from django.shortcuts import get_object_or_404, render,redirect
from django.urls import reverse
from ..models import OnlineOrder,OnlineOrderItems
from product_manager.models import Product
import json

def shopping_cart(request):
    context = dict()
    context['title'] = "Cart"
    return render(request,'e_commerce/shopping-cart.html',context)

def process_order(request):
    if request.method == 'POST':
        print(request.body)
        order_data = json.loads(request.body)
        order = OnlineOrder(user=request.user,
                    shipping_address=order_data['shipping_address'],
                    billing_address =order_data['billing_address'],
                    grandtotal = order_data['gtotal'],
                    )
        order.save()
        for item_data in order_data['items']:
            item = OnlineOrderItems(order_id = order.id,
            product_id=item_data['product_id'],
            product_name=item_data['product'],
            quanitiy = item_data['quanitity'],
            uprice = item_data['uprice'],
            totalprice = item_data['ptotal'])
            item.save()
            product = get_object_or_404(Product,id=item.product_id)
            product.stock = product.stock - item.quanitiy
            product.save()
    context = dict()
    context['order'] = order
    return render(request,'e_commerce/order-confirmation.html',context)

def order_receipt(request,id):
    context = dict()
    context['title'] = 'Receipt'
    context['order'] = get_object_or_404(OnlineOrder,id=id)
    return render(request,'e_commerce/online-receipt.html',context)

def order_confirmation(request,id):
    context = dict()
    context['title'] = 'Order confirmed'
    context['order'] = get_object_or_404(OnlineOrder,id=id)
    return render(request,'e_commerce/order-confirmation.html',context)

def order_history(request):
    context = dict()
    context['title'] = 'Order history'
    return render(request,'e_commerce/order/history.html',context)