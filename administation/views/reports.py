from django.shortcuts import get_object_or_404,render,redirect,reverse
from e_commerce.models import Order,OnlineOrder,OrderItems,OnlineOrderItems
from django.contrib.auth.models import User
from product_manager.models import Product

def index(request):
    context = dict()
    context['title'] = 'Reports'
    context['offile_odr'] = Order.objects.all()
    context['online_odr'] = OnlineOrder.objects.all()
    return render(request,'administration/reports/index.html',context)

def user_reports(request):
    context = dict()
    context['title'] = "Online users"
    context['online_users'] = User.objects.filter(is_superuser=False,is_staff=False).all()
    return render(request,'administration/reports/user_reports.html',context)


def stock_clear(request):
    context = dict()
    context['title'] = 'Stock Clearing'
    context['products'] = Product.objects.order_by('modified_on').all()
    return render(request,'administration/reports/stock_clear.html',context)
def insights(request):
    context = dict()
    context['title'] = 'Insights'
    offline_orders = pd.DataFrame(OrderItems.objects.all().values())
    products = Product.objects.all()
    for product in products:
        prob_of_p = offline_orders[offline_orders.product_name==product.name].shape[0] 
    