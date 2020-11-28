from django.shortcuts import render
from django.http import Http404


def home(req):
    return render(req, 'ashgear/home.html',
                  {'projects': ['project1', 'project2']})


def handler404(req, exception):
    return render(req, "errors/404.html", {})


def products(req):
    raise Http404("Poll does not exist")
