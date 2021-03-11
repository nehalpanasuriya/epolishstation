from django.shortcuts import render, HttpResponse,redirect   
#user add
from .models import signup,feedback,contactmodel,emergencynumbermodel,case,casestatus,commisnermodel
from .forms import signupform,feedbackform,contactform,emergencyform,caseform,casestatusform,commisnerform
#email send in django
from django.conf import settings 
from django.core.mail import send_mail 
import random
# import required module 
import requests 
import json

# Create your views here.

#signup_____crude______INSERT
def index(request):
    user=request.session.get('uname')
    # c_uname=request.session.get('c_uname')
    if request.method=='POST':
        myform=signupform(request.POST)
        if myform.is_valid():
            myform.save()
            subject = 'welcome to e-polishstation site'
            message = f'Hi , thank you for registering in e-polishstation.'
            email_from = settings.EMAIL_HOST_USER 
            recipient_list = [myform.cleaned_data.get('uname')]  
            send_mail( subject, message, email_from, recipient_list ) 
        
           
            otp=random.randint(11111,99999)
            usernm=request.POST['uname']
            url = "https://www.fast2sms.com/dev/bulk" 
            my_data = { 
                # Your default Sender ID 
                'sender_id': 'FSTSMS',  
                
                # Put your message here! 
                'message': f'Hello, {usernm}. Welcome to mysite. Your OTP for login is {otp}',  
                
                'language': 'english', 
                'route': 'p', 
                
                # You can send sms to multiple numbers 
                # separated by comma. 
                'numbers': '7043649941'    
            } 
            headers = { 
                'authorization': 'l6RFCOaetkTwZ0yfmQsL9hDnuoYW4vjX7qxdGiNArEbz35SBcMNt7HYBkglS5dfIz3GqJCwZXVr6L4WU', 
                'Content-Type': "application/x-www-form-urlencoded", 
                'Cache-Control': "no-cache"
            }
            response = requests.request("POST", 
                                        url, 
                                        data = my_data, 
                                        headers = headers) 
            returned_msg = json.loads(response.text) 
            print(returned_msg['message'])
            print("signup successfully")
            return redirect("index")
        else:
            print(myform.errors)
    else:
        myform=signupform()            
    return render(request,'index.html',{"myform":myform,"user":user})



#view user
def viewsignup(request):
    commi=request.session.get('c_uname')
    user=request.session.get('uname')
    datauser=signup.objects.all()
    return render(request,'viewsignup.html',{'datauser':datauser,'user':user,'commi':commi})


#update
def updateuser(request,id):
    if request.method=="POST":
        m_frm=signupform(request.POST)
        id=signup.objects.get(id=id)
        if m_frm.is_valid():
            m_frm=signupform(request.POST,instance=id)
            m_frm.save()
            return redirect("/viewsignup")
        else:
            print(m_frm.errors)

    else:
        print("else part")
        m_frm=signupform

    return render(request,'updateuser.html',{'m_frm':m_frm,'signupdata':signup.objects.get(id=id)})


#delete
def delete(request,id):
    signupid=signup.objects.get(id=id)
    signupid.delete()
    return redirect('viewsignup')
    
#crude feedback _insert
def addfeed(request):
    commi=request.session.get('c_uname')
    user=request.session.get('uname')
    if request.method=='POST':
        myfeed=feedbackform(request.POST)
        if myfeed.is_valid():
            myfeed.save()
            print("gave succefully")
            return redirect("viewfeed")
        else:
            print(myfeed.errors)
    else:
        myfeed=feedbackform()
    return render(request,'addfeed.html',{"myfeed":myfeed,"user":user,'commi':commi})

#view feed
def viewfeed(request):
    
    commi=request.session.get('c_uname')
    user=request.session.get('uname')
    datafeed=feedback.objects.all()
    return render(request,'viewfeed.html',{'datafeed':datafeed,'user':user,'commi':commi})

def deletefeed(request,id):
    datafeed=feedback.objects.get(id=id)
    datafeed.delete()
    return redirect('viewfeed')

def login(request):
    commi=request.session.get('c_uname')
    user=request.session.get('user')
    if request.method=='POST':
        uname=request.POST['uname']
        password=request.POST['password']
        u_data=signup.objects.get(uname=uname)
        user=signup.objects.filter(uname=uname,password=password)
        if user:
            request.session['uname']=uname
            request.session['id']=u_data.id
            
            return redirect('index')
        else:
            return HttpResponse("incorrect username and password")
    else:
         return render(request,'login.html',{'user':user,'commi':commi})
  

# case crud ________insert_________
def addcase(request):
    commi=request.session.get('c_uname')
    user=request.session.get('uname')
    if request.method=='POST':
        myform=casestatusform(request.POST,request.FILES)
        if myform.is_valid():
            myform.save()
            print("your case added")
            return redirect('index')
        else:
            print(myform.errors)
            print("first else")
    else:
        myform=casestatusform() 
        print("else")              
    return render(request,'addcase.html',{'myform':myform,'user':user,'commi':commi})

def contact(request):
    commi=request.session.get('c_uname')
    user=request.session.get('uname')
    if request.method=='POST':
        mycontact=contactform(request.POST)
        if mycontact.is_valid():
            mycontact.save()
            return redirect('index')
        else:
            print(mycontact.errors)
    else:
        mycontact=contactform()
    return render(request,'contact.html',{'mycontact':mycontact,'user':user,'commi':commi})

def logoutform(request):
    try:
        del request.session['uname']
        del request.session['c_uname']

    except:
        pass
    finally:
        return redirect('/login')
   
def updatepro(request):
    uid=request.session.get('id')
    if request.method=='POST':
        proform=signupform(request.POST)
        id=signup.objects.get(id=uid)
        if proform.is_valid():
            proform=signupform(request.POST,instance=id)
            proform.save()
            return redirect('login')
        else:
            print(proform.errors)
    else:
        proform=signupform()
    return render(request,'updatepro.html',{'proform':proform,'signupdata':signup.objects.get(id=uid)})

        
def viewcase(request):
    commi=request.session.get('c_uname')
    user=request.session.get('uname')
    datacase=casestatus.objects.all()
    return render(request,'viewcase.html',{'datacase':datacase,'user':user,'commi':commi})


def updatecase(request,id):
    commi=request.session.get('c_uname')
    user=request.session.get('uname')
    cid=request.session.get('id')
    if request.method=='POST':
        myform=casestatusform(request.POST,request.FILES)
        id=casestatus.objects.get(id=id)
        if myform.is_valid():
            myform=casestatusform(request.POST,request.FILES,instance=id)
            myform.save()
            return redirect('viewcase')
        else:
            print(myform.errors)
    else:
        myform=casestatusform()
    return render(request,'updatecase.html',{'casestatus':casestatus.objects.get(id=id),'myform':myform,'commi':commi,'user':user})
    

def deletecase(request,id):
    datadelete=casestatus.objects.get(id=id)
    datadelete.delete()
    return redirect('viewcase')


def viewcontact(request):
    commi=request.session.get('c_uname')
    user=request.session.get('uname')
    datacontact=contactmodel.objects.all()
    return render(request,'viewcontact.html',{'datacontact':datacontact,'commi':commi,'user':user})


def deletecontact(request,id):
    datacontact=contactmodel.objects.get(id=id)
    datacontact.delete()
    return redirect('viewcontact')


# insert emergencynumber
def emergencynumber(request):
    if request.method=='POST':
        myform=emergencyform(request.POST)
        if myform.is_valid():
            myform.save()
            return redirect('viewnumber')
        else:
            print(myform.errors)
    else:
        myform=emergencyform()
    return render(request,'emergencynumber.html')


#view e_numbers
def viewnumber(request):
    commi=request.session.get('c_uname')
    user=request.session.get('uname')
    dataview=emergencynumbermodel.objects.all()
    return render(request,'viewnumber.html',{'dataview':dataview,'user':user,'commi':commi})

#delete number
def deletenumber(request,id):
    dataview=emergencynumbermodel.objects.get(id=id)
    dataview.delete()
    return redirect('viewnumber')

def updatenum(request,id):
    commi=request.session.get('c_uname')
    uid=request.session.get('id')
    if request.method=='POST':
        mynform=emergencyform(request.POST)
        id=emergencynumbermodel.objects.get(id=uid)
        if mynform.is_valid():
            mynform=emergencyform(request.POST,instance=id)
            mynform.save()
            return redirect('viewnumber')
        else:
            print(mynform.errors)
    else:
        mynform=emergencyform()
    return render(request,'updatenum.html',{'mynform':mynform,'commi':commi,'upnum':emergencynumbermodel.objects.get(id=id)})


def commisner(request):
    # commi=request.session.get('c_uname')
    # c_id=request.session.get('c_uname')
    if request.method=='POST':
        c_uname=request.POST['c_uname']
        c_password=request.POST['c_password']
        c_data=commisnermodel.objects.get(c_uname=c_uname)
        commi=commisnermodel.objects.filter(c_uname=c_uname,c_password=c_password)
        if commi:
            request.session['c_uname']=c_uname
            request.session['id']=c_data.id
            return redirect('indexcommisner')
        else:
           print('incorrect pass and userame')
    else:
        return render(request,'commisner.html')


def indexcommisner(request):
    commi=request.session.get('c_uname')
    return render(request,'indexcommisner.html',{'commi':commi})

