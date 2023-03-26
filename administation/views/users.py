from django.shortcuts import render,get_object_or_404,redirect,reverse
from ..models import Staff
from django.contrib.auth.models import User,Group
from django.contrib.auth.forms import UserCreationForm
from ..forms import StaffCreationForm,UserSignUpForm
from django.http import HttpResponse,JsonResponse,HttpResponseBadRequest
# Create your views here.
def index(request):
    context = dict()
    context['title'] = 'Admin Dashboard | User Management'
    context['staffs'] = Staff.objects.filter(user__is_staff =True,user__is_superuser=False).all()
    return render(request,'administration/staff-list.html',context)

def new_staff(request):
    context = dict()
    context['title'] = 'Enroll new staff '
    user_form = UserSignUpForm(data=request.POST or None)
    staff_form = StaffCreationForm(data= request.POST or None,files=request.FILES or None)
    if request.method =='POST':
        if user_form.is_valid() and staff_form.is_valid():
            user= user_form.save()
            staff = staff_form.save()
            staff.user = user
            user.is_staff=True
            user.save()
            staff.save()
            return redirect(reverse('admin:staff.list'))
    context['user_form'] = user_form
    context['staff_form'] = staff_form
    return render(request,'administration/staff-edit.html',context)

def toggle_lock_staff(request,id):
    staff = get_object_or_404(Staff,id=id)
    user = staff.user
    user.is_active = False if user.is_active else True
    user.save()
    return HttpResponse(status=200)

def remove_staff(request,id):
    staff= get_object_or_404(Staff,id=id)
    user = staff.user
    user.delete()
    return HttpResponse(status=200)

def toggle_lock_user(request,id):
    user = get_object_or_404(User,id=id)
    user.is_active = False if user.is_active else True
    user.save()
    return HttpResponse(status=200)
