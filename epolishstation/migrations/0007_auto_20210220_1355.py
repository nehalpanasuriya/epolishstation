# Generated by Django 3.1.5 on 2021-02-20 08:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('epolishstation', '0006_emergencynumbermodel'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emergencynumbermodel',
            name='number',
            field=models.IntegerField(),
        ),
    ]
