# Generated by Django 3.1.7 on 2021-03-08 10:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('epolishstation', '0012_auto_20210308_1600'),
    ]

    operations = [
        migrations.AlterField(
            model_name='casestatus',
            name='aadhar',
            field=models.ImageField(upload_to='upload/'),
        ),
    ]
