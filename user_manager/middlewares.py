from django.shortcuts import reverse, redirect
from django.contrib import messages
from django.contrib.auth import logout
import re
class LoginMiddleWare:
    def __init__(self, get_response):
        self.get_response = get_response
        # One-time configuration and initialization.

    def __call__(self, request):
        user = request.user
        url = request.path
        
        if re.search(r'^.admin.*',url,re.IGNORECASE):
            if not user.is_superuser:
                logout(request)
                messages.info(request," You are not a privilaged user")
                return redirect(reverse('user:login'))
        if re.search(r'^.staff.*',url,re.IGNORECASE):
            if not user.is_staff:
                logout(request)
                messages.info(request," You are not a privilaged user")
                return redirect(reverse('user:login'))
        if re.search(r'^.ecommerce.*',url,re.IGNORECASE):
            if  user.is_staff or user.is_superuser:
                logout(request)
                messages.info(request," Invalid user")
                return redirect(reverse('user:login'))

        if re.search(r'^/$', url, re.IGNORECASE):
            if user.is_superuser == True:
               return redirect(reverse('admin:dashboard'))
            if user.is_staff == True:
                return redirect(reverse('staff:dashboard'))
        
        response = self.get_response(request)
        if re.search(r'^(?!.*(logout|login|.)).*$',url,re.IGNORECASE):
            if(user.is_anonymous == True):
                messages.info(request,messages='Please Login First !!')
                return redirect(reverse('user:login'))
        # Code to be executed for each request/response after
        # the view is called.

        return response