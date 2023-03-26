
from django.shortcuts import render,redirect,reverse,get_object_or_404
from product_manager.models import Product
from e_commerce.models import Order,OnlineOrder,OrderItems,OnlineOrderItems
from django.db.models import Count,Avg

def index(request):
    context = dict()
    context['title'] = 'Insights'
    context['fav_on_items']=OnlineOrderItems.objects \
                .values('product_name','product_id') \
                .annotate(bcount=Count('product_id'),max=Avg('quanitiy')) \
                .order_by('-bcount')[:10]
    context['fav_off_items'] = OrderItems.objects \
                .values('product_name','product_id') \
                .annotate(bcount=Count('product_id'),max=Avg('count')) \
                .order_by('-bcount')[:10]
    return render(request,'administration/insight/index.html',context)
