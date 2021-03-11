from django.contrib import admin
from django.urls import path
from epolishstation import views

urlpatterns = [
    path('',views.index,name="index"),
    path('index/',views.index,name="index"),
    path('addfeed/',views.addfeed,name="addfeed"),
    path('contact/',views.contact,name="contact"),
    path('logoutform/',views.logoutform,name="logoutform"),
    path('login/',views.login,name="login"),
    path('viewsignup/',views.viewsignup,name="viewsignup"),
    path('viewfeed/',views.viewfeed,name="viewfeed"),
    path('viewcontact/',views.viewcontact,name="viewcontact"),
    path('viewnumber/',views.viewnumber,name="viewnumber"),
   
    path('emergencynumber/',views.emergencynumber,name="emergencynumber"),
    path('deletenumber/<int:id>',views.deletenumber,name="deletenumber"),
    path('updatenum/<int:id>',views.updatenum,name="updatenum"),
   
    path('updateuser/<int:id>/',views.updateuser,name="updateuser"),
    path('updatepro/',views.updatepro,name="updatepro"),

    path('delete/<int:id>/',views.delete,name="delete"),
    path('deletecontact/<int:id>/',views.deletecontact,name="deletecontact"),
    path('addcase/',views.addcase,name="addcase"),
    path('viewcase/',views.viewcase,name="viewcase"),
    path('deletefeed/<int:id>/',views.deletefeed,name="deletefeed"),
    path('deletecase/<int:id>/',views.deletecase,name="deletefeed"),
    
    #commisner
    path('commisner/',views.commisner,name="commisner"),
    path('indexcommisner/',views.indexcommisner,name="indexcommisner"),
    path('updatecase/<int:id>/',views.updatecase,name="updatecase"),



]