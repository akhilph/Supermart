from django.urls import path
from .views import dashboard,delivery,users,categories,products,product_image,reports,insight
app_name = 'admin'
urlpatterns = [
    path('',dashboard.index, name ='dashboard'),
    path('feedbacks',dashboard.feedbacks,name='feedbacks'),
    path('complaints',dashboard.complaints,name='complaints'),
    # city urls 
    path('city/new',delivery.add_city, name='city.new'),
    path('city',delivery.list_cities, name = 'city.list'),
    path('city/<int:id>/edit/',delivery.edit_city,name='city.edit'),
    path('city/<int:id>/delete',delivery.delete_city, name='city.delete'),
    path('district/citys',delivery.get_district_city,name='district.city.get'),
    # category urls 
    path('product-category/new',categories.add_category, name='category.new'),
    path('product-categories/',categories.existing_category, name='category.list'),
    path('product-category/<int:id>/edit/',categories.edit_category,name='category.edit'),
    path('product-category/<int:id>/delete',categories.delete_category, name='category.delete'),
    # products urls
    path('product/new',products.add_product, name='product.new'),
    path('product/',products.existing_product, name='product.list'),
    path('product/<int:id>/edit/',products.edit_product,name='product.edit'),
    path('product/<int:id>/delete',products.delete_product, name='product.delete'),
    #product images
    path('product/<int:id>/images',product_image.add_product_image, name='product.image.list'),
    path('product/image/<int:id>/delete',product_image.remove_product_image, name='product.image.delete'),
    path('product/image/<int:id>/delete-all',product_image.remove_all_product_images, name='product.image.delete.all'),
    path('prodcut/stock-clearing',reports.stock_clear,name='product.stock.clear'),

    #staff administration urls
    path('user/list',users.index, name='staff.list'),
    path('staff/new',users.new_staff,name='staff.new'),
    path('staff/<int:id>/lock',users.toggle_lock_staff,name="staff.toggle.lock"),
    path('staff/<int:id>/remove',users.remove_staff,name='staff.remove'),

    path('reports',reports.index,name='reports'),
    ## online user management links

    path('online/users',reports.user_reports,name='online.users.list'),
    path('online/user/<int:id>/lock',users.toggle_lock_user,name='user.toggle.lock'),

    path('insights',insight.index,name='insight.index')
]