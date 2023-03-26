from django.forms import ModelForm
from django.forms import models
from .models import City,Category,Staff
from django.contrib.auth.models import User;
from django.contrib.auth.forms import UserCreationForm;
class CreateCityForm(ModelForm):
    class Meta:
        model = City
        fields = '__all__'
        
class CreateCategoryForm(ModelForm):
    class Meta:
        model = Category
        fields = '__all__'

class StaffCreationForm(ModelForm):

    class Meta:
        model = Staff
        fields = '__all__'
        exclude = ['user']

class UserSignUpForm(UserCreationForm):
    
    class Meta:
        model = User
        fields = ('email', 'password1', 'password2','first_name','last_name','username' )