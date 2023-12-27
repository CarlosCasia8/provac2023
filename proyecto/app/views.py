from django.shortcuts import render
from .models import *
from django.http import JsonResponse
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
    return JsonResponse('Pago completado', safe=False)