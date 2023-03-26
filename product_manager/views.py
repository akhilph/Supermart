from django.shortcuts import render,redirect,reverse
from .forms import CreateProductTypeForm
# Create your views here.
def create(request):
    context = dict()
    if request.method == 'GET':
        context['form'] = CreateProductTypeForm()
        return render(request,'product_manager/create_product.html',context)
    form = CreateProductTypeForm(data= request.POST, files= request.FILES)
    if form.is_valid():
        form.save()
    return redirect(reverse('e_commerce:home.index'))