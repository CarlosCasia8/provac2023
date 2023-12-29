from django.contrib import admin
from django.urls import path, include

from . import views

urlpatterns = [
    path('tienda/', views.store, name='tienda'), #direccion principal
    path('cart/', views.cart, name='carrito'),
    path('checkout/', views.checkout, name='pago'),
    path('usuario/', views.usuario, name='usuario'),
    path('registro/', views.registro, name='registro'),
    path('update_item/', views.updateItem, name='update_item'),
    path('process_order/', views.processOrder, name='process_order'),
    path('accounts/', views.login, name='login'),
    path('logout/', views.exit , name='exit'),
    path('register/', views.register , name='register'),
]

