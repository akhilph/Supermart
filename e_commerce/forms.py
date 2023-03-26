from django.db import models
from django.db.models import fields
from django.forms import ModelForm, widgets
from django import forms
from .models import Review,Query,Complaint_query

class UserReviewForm(ModelForm):
    class Meta:
        model   = Review
        fields  = '__all__'
        exclude = ['reviewed_dt','reviewed_dt']

class QueryForm(ModelForm):
    class Meta:
        model =Query
        fields = '__all__'
        widgets= {
            'user':forms.HiddenInput()
        }

class ComplaintQueryForm(ModelForm):
    class Meta:
        model = Complaint_query
        fields = '__all__'
        widgets= {
            'user':forms.HiddenInput()
        }