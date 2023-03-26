from user_manager.forms import CustomerCreateForm
from administration.forms import UserSignUpForm
from django.shortcuts import render,redirect,reverse
from django.contrib import messages
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
# Create your views here.
def user_login(request):
    if request.method == 'GET':
        return render(request,'user_manager/login.html')

    username = request.POST.get('username')
    password = request.POST.get('password')

    user = authenticate(username = username,password =password)

    if user is not None:
        login(request, user)
        if user.is_superuser:
                return redirect(reverse('admin:dashboard'))
        if user.is_staff:
            return redirect(reverse('staff:dashboard'))
        else:
            return redirect(reverse('ecommerce:user.dashboard'))
            
    messages.error(request, 'Invalid Username OR Password')
    return render(request,'user_manager/login.html')

def user_logout(request):
    logout(request)
    messages.success(request,'you have been successfully logged out')
    return redirect(reverse('user:login'))

def register_user(request):
    context = dict()
    context['title'] = 'Register Now'
    user_form = UserSignUpForm(data=request.POST or None)
    customer_form = CustomerCreateForm(data= request.POST or None,files=request.FILES or None)
    if request.method =='POST':
        if user_form.is_valid() and customer_form.is_valid():
            user= user_form.save()
            customer_form = customer_form.save()
            customer_form.user = user
            customer_form.save()
            messages.info(request,message="registration successfull")
            return redirect(reverse('user:login'))
    context['user_form'] = user_form
    context['customer_form'] = customer_form
    return render(request,'user_manager/register.html',context)