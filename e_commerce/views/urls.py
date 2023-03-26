from django.urls import path
from ..views import views as vs,order

app_name = 'ecommerce'

urlpatterns = [
   path('',vs.homepage,name="user.dashboard"),
   path('products',vs.product_lookup, name='product.lookup'),
   path('products/search',vs.product_query, name='product.search'),
   path('product/<int:id>/details',vs.product_details, name='product.details'),
   path('product/<int:id>/review',vs.write_review,name='product.new.review'),
   path('product/search',vs.product_search,name='product.search-name'),
   path('shopping-cart/',order.shopping_cart,name='shopping.cart'),
   path('shopping-cart/process',order.process_order,name='shopping.process'),
   path('shopping/<int:id>/receipt',order.order_receipt,name='shopping.receipt'),
   path('order/<int:id>/confirmation',order.order_confirmation,name='order.confirmation'),
   path('profile',order.order_history,name='order.history')
]