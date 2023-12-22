from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('', views.store, name='Tienda'), #direccion principal
    path('cart/',views.cart, name='Carrito'),
    path('checkout/',views.checkout, name='Pago'),
]