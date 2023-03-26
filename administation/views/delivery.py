from django.shortcuts import render,redirect,reverse,get_object_or_404
from django.http import HttpResponse,JsonResponse
from django.core import serializers
from ..forms import CreateCityForm
from ..models import City
def add_city(request):

    context = dict()
    context['title'] = 'Delivery Locations'
    context['form'] = CreateCityForm()
    if request.method == 'POST':
        form = CreateCityForm(data=request.POST)
        if form.is_valid():
            form.save()
            return redirect(reverse('admin:city.list'))
        else:
            context['form'] = form
    return render(request,'administration/add_city.html',context)
def get_district_city(request):
    district = request.POST.get('district')
    city = City.objects.filter(district=district).all()
    return render(request,'administration/city_dropdown.html',{'cities':city})

def list_cities(request):
    context = dict()
    context['title'] = 'Delivery Locations'
    context['cities'] = City.objects.all()
    return render(request,'administration/list_cities.html',context)

def edit_city(request,id):
    context = dict()
    context['title'] = 'Edit City Details'
    context['form'] = CreateCityForm(instance=get_object_or_404(City,id=id))
    if request.method == 'POST':
        form = CreateCityForm(instance=get_object_or_404(City,id=id),data=request.POST)
        if form.is_valid():
            form.save()
            return redirect(reverse('admin:city.list'))
        else:
            context['form'] = form
    
    return render(request,'administration/add_city.html',context)

def delete_city(request,id):
    city = get_object_or_404(City,id=id)
    city.delete()
    return redirect(reverse('admin:city.list'))