# Generated by Django 4.2.3 on 2023-12-26 23:51

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0002_rename_oderitem_orderitem_product_image'),
    ]

    operations = [
        migrations.RenameField(
            model_name='order',
            old_name='Customer',
            new_name='customer',
        ),
        migrations.RenameField(
            model_name='orderitem',
            old_name='Product',
            new_name='product',
        ),
        migrations.RenameField(
            model_name='shippingaddress',
            old_name='Customer',
            new_name='customer',
        ),
    ]
