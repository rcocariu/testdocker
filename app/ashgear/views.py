from django.shortcuts import render
from django.http import request, Http404
from django.template import RequestContext


def home(request):
    return render(request, 'ashgear/home.html', {'projects': ['project1', 'project2']})


def handler404(request, exception):
    return render(request, "errors/404.html", {})

def products(request):
    raise Http404("Poll does not exist")