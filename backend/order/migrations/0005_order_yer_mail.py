# Generated by Django 5.0.2 on 2024-02-28 15:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0004_order_payed'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='yer_mail',
            field=models.EmailField(default='a@a.com', max_length=254),
        ),
    ]
