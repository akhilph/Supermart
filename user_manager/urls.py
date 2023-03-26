from django.urls import path
from . import views
from administration.views import delivery
app_name = 'user'
urlpatterns = [
    path('login',views.user_login, name= 'login'),
    path('logout',views.user_logout, name='logout'),
    path('register',views.register_user,name='register'),
    path('city',delivery.get_district_city, name='district.city.get')
]