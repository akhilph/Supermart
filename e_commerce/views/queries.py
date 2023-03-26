from django.db.models.query import RawQuerySet
from django.shortcuts import render,redirect,get_object_or_404
from django.urls import reverse
from django.contrib import messages
from ..forms import QueryForm,ComplaintQueryForm

def feedback(request):
    context = dict()
    context['title'] = 'Feedback form'
    form= QueryForm(initial={'user':request.user},data =request.POST or None,files=request.FILES or None)
    if request.method=='POST' and form.is_valid():
        form.save()
        messages.success(request,'your feedback is successfully submit')
        return redirect(reverse('e_commerce:home.index'))
    context['form'] =form
    return render(request,'e_commerce/queries/feedback.html',context)

def complaints(request):
    context = dict()
    context['title'] = 'Complaint form'
    form= ComplaintQueryForm(initial={'user':request.user},data =request.POST or None,files=request.FILES or None)
    if request.method=='POST' and form.is_valid():
        form.save()
        messages.success(request,'your feedback is successfully submit')
        return redirect(reverse('e_commerce:home.index'))
    context['form'] =form
    return render(request,'e_commerce/queries/feedback.html',context)