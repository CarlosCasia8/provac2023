from django.shortcuts import render, redirect
import datetime
from .models import *
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout, login as th
from .forms import CustomUserCreationForm
from django.contrib.auth import authenticate


import json
# Create your views here.
def store(request):
    if request.user.is_authenticated:
        Customer = request.user.customer
        order, created = Order.objects.get_or_create(customer=Customer, complete=False)
        items = order.orderitem_set.all()
        cartItems = order.get_cart_items
    else:
        items= []
        order={'get_cart_items':0,'get_cart_total':0, 'shipping': False}
        cartItems = order['get_cart_items']

    products = Product.objects.all()
    context = {'products':products}
    return render(request,'generales/store.html',context)
@login_required 
def cart(request):
    if request.user.is_authenticated:
        Customer = request.user.customer
        order, created = Order.objects.get_or_create(customer=Customer, complete=False)
        items = order.orderitem_set.all()
    else:
        items= []
        order={'get_cart_items':0,'get_cart_total':0, 'shipping': False}

    context = {'items':items, 'order':order}
    return render(request,'generales/cart.html',context)

def checkout(request):
    if request.user.is_authenticated:
        Customer = request.user.customer
        order, created = Order.objects.get_or_create(customer=Customer, complete=False)
        items = order.orderitem_set.all()
    else:
        items= []
        order={'get_cart_items':0,'get_cart_total':0, 'shipping': False}

    context = {'items':items, 'order':order}
    return render(request,'generales/checkout.html',context)

def usuario(request):
    context = {}
    return render(request,'generales/usuario.html',context)

def login(request):

    #iniciar sesion
    if request.method == 'POST':
        nom= request.POST["username"]
        pas= request.POST["password"]
        print(nom+pas)

        comprobarLOgin = usuario.objects.filter(Username=nom, Password=pas).values()
        if comprobarLOgin:
            print(comprobarLOgin[0])
        else:
              datos ={'r2': 'Error de usuario o contraseña!!'}
              return render(request, 'registration/login.html', datos)

    else:
        datos ={'r2': 'No se puede proccesar la solicitud!!'}
        return render(request, 'registration/login.html', datos)
   # context = {}
   # return render(request,'registration/login.html',context)

def registro(request):
    context = {}
    return render(request,'generales/registro.html',context)

def updateItem(request):
    data = json.loads(request.body)
    producId = data['productId']
    action = data['action']
    print('productId', producId)
    print('action', action)
    customer =request.user.customer

    
    product = Product.objects.get(id=producId)
    order, created = Order.objects.get_or_create(customer=customer, complete=False)
    orderItem, created= OrderItem.objects.get_or_create(order=order, product=product)

    if action == 'add':
        orderItem.quantity = (orderItem.quantity + 1)
    elif action == 'remove':
        orderItem.quantity = (orderItem.quantity - 1)

    orderItem.save()
    if orderItem.quantity <= 0:
        orderItem.delete()

    return JsonResponse('El curso fue agregado', safe=False)

def processOrder(request):
    transacion_id = datetime.datetime.now().timestamp()
    data = json.loads(request.body)
    if request.user.is_authenticated:
        customer = request.user.customer
        order, created = Order.objects.get_or_create(customer=Customer, complete=False)
        total = float(data['shipping-info']['total'])
        order.transaction_id = transacion_id
        if total == order.get_cart_total:
            order.complete=True
        order.save()
    if order.shipping == True:
        ShippingAddress.objects.create(
            customer=Customer,
            order=order,
            #nombre=data['shipping']['nombre'],
            address=data['shipping']['address'],
            city=data['shipping']['city'],
            state=data['shipping']['state'],
            #vencimiento=data['shipping']['vencimiento'],
            zipcode=data['shipping']['zipcode'],
         )
    else:  
        print('Usuario no autenticado')
    print('data', request.body)
    return JsonResponse('Pago completado', safe=False)

def exit(request):
    logout(request)
    return redirect('tienda')

def register(request):
    data ={ 
        'form': CustomUserCreationForm()
    }
    if request.method == 'POST':
        user_creation_form = CustomUserCreationForm(data=request.POST)

        if user_creation_form.is_valid():
            user_creation_form.save()
            user = authenticate(username=user_creation_form.cleaned_data['username'], password = user_creation_form.cleaned_data['password1'])
            th(request, user)
            return redirect('login')
    return render(request, 'registration/register.html', data)