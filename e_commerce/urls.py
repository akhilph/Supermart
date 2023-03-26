from django.urls import path
from .views import views,queries

app_name = 'e_commerce'

urlpatterns = [
    path('', views.homepage, name='home.index' ),
    path('feedback',queries.feedback,name='queries.feedback'),
    path('complaints',queries.complaints,name='queries.complaints')
    
]