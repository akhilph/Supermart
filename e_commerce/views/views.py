import json
from django.shortcuts import get_object_or_404, render,redirect,reverse
from django.contrib import messages
from product_manager.models import Product
from administration.models import Category
from ..forms import UserReviewForm
from e_commerce.models import Review
from django.db.models import Q

def homepage(request):
    context = dict()
    context['title'] = ' Welcome to SuperMart - Your favorite supermarket'
    context['categories'] = Category.objects.all()
    context['products'] = Product.objects.filter(stock__gt=0).all()
    return render(request,'e_commerce/index.html',context)

def product_lookup(request):
    context = dict()
    context['title'] = 'Products'
    context['categories'] = Category.objects.all()
    context['products'] = Product.objects.filter(stock__gt=0).all()
    return render(request,'e_commerce/product-lookup.html',context)

def product_query(request):
    context= dict()
    category_ids = json.loads(request.GET.get('categories'))
    if category_ids:
        context['products'] = Product.objects.filter(stock__gt=0,category_id__in=category_ids).all()
    else:
        context['products'] = Product.objects.filter(stock__gt=0).all()

    return render(request,'e_commerce/product-list.html',context)

def product_details(request,id):
    context =dict()
    context['product'] = get_object_or_404(Product,id=id)
    context['title'] =context['product'].name
    return render(request,'e_commerce/product-details.html',context)

def write_review(request,id):
    context = dict()
    product = get_object_or_404(Product,id=id)
    context['title'] ="Review: "+ product.name 
    review=[]
    if Review.objects.filter(user_id=request.user.id,product_id=id).count():
        review = Review.objects.filter(user_id=request.user.id,product_id=id).get() or None
    review_form = UserReviewForm(instance=review or None,
                        initial={"product":product.id,"user":request.user},
                        data=request.POST or None,
                        files=request.FILES or None
                        )
    if request.method == 'POST':
        if review_form.is_valid():
            review_form.save()
            messages.info(request,message="Review is successfully added")
            return redirect(reverse('ecommerce:product.details',args=[id]))
    context['review_form'] = review_form
    return render(request,'e_commerce/write-review.html',context)

def product_search(request):
    context = dict()
    name = request.GET.get('name')
    context['products'] = Product.objects.filter(Q(name__icontains=name) | Q(tags=name) | Q(category__name__icontains=name),stock__gt=0).all()
    return render(request,'e_commerce/product-list.html',context)