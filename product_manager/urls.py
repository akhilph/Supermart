from django.urls import path
from . import views
app_name = 'product'
urlpatterns = [
    path('new',views.create, name ='create')
]