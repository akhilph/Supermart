from django.urls import path
from .views import dashboard,order
app_name = 'staff'
urlpatterns = [
    path('dashboard',dashboard.dashboard,name="dashboard"),
    path('password/change',dashboard.change_password,name='change-password'),
    path('product/details',order.get_product_details,name='ajax.product.details'),
    path('order/new',order.new_order,name='order.new'),
    path('order/upload',order.place_order,name='order.place'),
    path('order/<int:id>/receipt',order.order_receipt,name='order.receipt'),
    path('online/orders',order.view_online_orders,name='online.orders'),
    path('online/order/<int:id>/details',order.online_order_details,name='online.order.details'),
    path('online/order/<int:id>/shipped',order.update_shipping_details,name='online.order.shipped'),

    path('orders/history',dashboard.order_history,name='order.history'),
    path('online/orders/history',order.online_order_history,name='online.order.history'),
    path('product/stock/verification',dashboard.stock_verification,name='product.stock.verification'),
    path('product/stock/update',dashboard.stock_updation,name='product.stock.update'),
    path('product/stock/bulk-update',dashboard.stock_blk_update,name='stock.blk.update')
]