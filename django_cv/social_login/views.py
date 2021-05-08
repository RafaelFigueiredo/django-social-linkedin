from django.contrib.auth import logout as auth_logout
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect

def login(request):
    return render(request, 'social_login/login.html')
    
@login_required()
def home(request):
    return render(request, 'home.html')

def logout(request):
    auth_logout(request)
    return redirect('/')

