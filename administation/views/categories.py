from django.shortcuts import render,redirect,reverse,get_object_or_404
from django.contrib import messages
from django.http import HttpResponse
from ..forms import CreateCategoryForm
from ..models import Category

def add_category(request):
    context = dict()
    context['title'] = 'Add Category'
    context['form']=CreateCategoryForm()
    if request.method=='POST':
        form=CreateCategoryForm(data=request.POST,files=request.FILES)
        if form.is_valid():
            form.save()
            messages.info(request,"Successfully Saved.")
        else:
            messages.info(request,"Invalid Inputs")
            context['form']= form
    return render(request,'administration/add_category.html',context)

def existing_category(request):
    context = dict()
    context['title']='Categories'
    context['categories'] = Category.objects.all()
    return render(request,'administration/list_category.html',context)
def edit_category(request,id):
    context = dict()
    context['title'] = 'Edit Category Details'
    context['form'] = CreateCategoryForm(instance=get_object_or_404(Category,id=id))
    if request.method == 'POST':
        form = CreateCategoryForm(instance=get_object_or_404(Category,id=id),data=request.POST)
        if form.is_valid():
            form.save()
            return redirect(reverse('admin:category.list'))
        else:
            context['form'] = form
    
    return render(request,'administration/add_category.html',context)

def delete_category(request,id):
    category= get_object_or_404(Category,id=id)
    category.delete()
    messages.info(request,"Category:{0} & Its items are deleted.. ".format(category))
    return redirect(reverse('admin:category.list'))