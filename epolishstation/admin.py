from django.contrib import admin
# user accesd

from.models import signup,feedback,case,contactmodel,emergencynumbermodel,casestatus,commisnermodel
# Register your models here.
admin.site.register(signup)
admin.site.register(feedback)
admin.site.register(case)
admin.site.register(contactmodel)
admin.site.register(emergencynumbermodel)
admin.site.register(casestatus)
admin.site.register(commisnermodel)


# $ git remote add origin https://github.com/nehalpanasuriya/e-station.git
