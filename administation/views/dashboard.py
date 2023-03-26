from django.db.models import query
from django.shortcuts import render
from e_commerce.models import Query,Complaint_query

# Create your views here.
def index(request):
    context = dict()
    context['title'] = 'Admin Dashboard'
    return render(request,'administration/dashboard.html',context)

def feedbacks(request):
    context = dict()
    context['title'] = 'Feedbacks'
    query = Query.objects.all()
    context['feedbacks'] = query
    return render(request,'administration/query.html',context)

def complaints(request):
    context = dict()
    context['title'] = 'Complaints'
    query = Complaint_query.objects.all()
    context['feedbacks'] = query
    return render(request,'administration/query.html',context)