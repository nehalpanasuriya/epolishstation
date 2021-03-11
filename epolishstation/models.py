from django.db import models


# Create your models here.
class signup(models.Model):
    fname=models.CharField(max_length=20)
    lname=models.CharField(max_length=20)
    uname=models.EmailField(max_length=30)
    password=models.CharField(max_length=15)
    city=models.CharField(max_length=20)
    state=models.CharField(max_length=15)
    zipcode=models.IntegerField()

    def __str__(self):
        return self.fname

class emergencynumbermodel(models.Model):
    number=models.IntegerField()
    info=models.CharField(max_length=50)

    def __str__(self):
        return self.info

class case(models.Model):
    uname=models.EmailField(max_length=30)
    complains=models.CharField(max_length=900)
    aadhar=models.ImageField(upload_to='media')
  
    def __str__(self):
        return self.complains

class casestatus(models.Model):
    uname=models.EmailField(max_length=30)
    complains=models.CharField(max_length=900)
    aadhar=models.ImageField(upload_to='media')
    status=models.CharField(max_length=20)
  
    def __str__(self):
        return self.status


class feedback(models.Model):
    uname=models.EmailField(max_length=30)
    cmnt=models.CharField(max_length=60)
    
    def __str__(self):
        return self.uname

class contactmodel(models.Model):
    name=models.CharField(max_length=40)        
    uname=models.EmailField(max_length=50)
    msg=models.CharField(max_length=800)

    def __str__(self):
        return self.name


class commisnermodel(models.Model):
    c_uname=models.EmailField(max_length=70)
    c_password=models.CharField(max_length=50)

    def __str__(self):
        return self.c_uname
