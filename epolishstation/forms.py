from django import forms
#import user
from .models import signup,feedback,contactmodel,emergencynumbermodel,case,casestatus,commisnermodel

class signupform(forms.ModelForm):
    class Meta:
        model=signup
        fields='__all__'

class feedbackform(forms.ModelForm):
    class Meta:
        model=feedback
        fields='__all__'

class caseform(forms.ModelForm):
    class Meta:
        model=case
        fields='__all__'

class contactform(forms.ModelForm):
    class Meta:
        model=contactmodel
        fields='__all__'


class emergencyform(forms.ModelForm):
    class Meta:
        model=emergencynumbermodel
        fields='__all__'
        
class casestatusform(forms.ModelForm):
    class Meta:
        model=casestatus
        fields='__all__'

class commisnerform(forms.ModelForm):
    class Meta:
        model=commisnermodel
        fields='__all__'