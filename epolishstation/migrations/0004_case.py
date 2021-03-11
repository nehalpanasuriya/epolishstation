# Generated by Django 3.1.6 on 2021-02-17 07:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('epolishstation', '0003_auto_20210216_1614'),
    ]

    operations = [
        migrations.CreateModel(
            name='case',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uname', models.EmailField(max_length=30)),
                ('complains', models.CharField(max_length=900)),
                ('aadhar', models.FileField(upload_to='upload')),
            ],
        ),
    ]
