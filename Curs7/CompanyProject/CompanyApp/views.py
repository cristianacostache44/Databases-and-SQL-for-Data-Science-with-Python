from django.shortcuts import render

# Create your views here.

from .models import Departament

def departments_view(request):

    ## ORM face in spate un SELECT * FROM departament
    all_departments = Departament.objects.all()

    return(render(request, 'modele.html', context = {'departments': all_departments}))