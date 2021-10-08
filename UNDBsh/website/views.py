from django.shortcuts import redirect, render
from django.contrib.auth import authenticate, login
from django.views.generic import TemplateView
from django.urls import reverse
from django.http import HttpResponse
from django.contrib import messages

# Create your views here.


class IndexTemplateView(TemplateView):
    template_name = "website/index.html"


class LoginTemplateView(TemplateView):
    template_name = "website/login.html"


def AuthenticateLogin(request):

    email = request.POST['email']
    senha = request.POST['senha']

    user = authenticate(request, username=email, password=senha)
    print(user)
    while True:
        if user is None:
            messages.info(request, 'Login ou senha inválidos.')
            return redirect('website:login', permanent=True)
        login(request, user)

        if(user.get_tipo() == 'admin'):
            pass

        elif(user.get_tipo() == 'gerente'):
            pass

        elif(user.get_tipo() == 'aluno'):
            return redirect('alunos:aluno_index', permanent=True)

        elif(user.get_tipo() == 'paciente'):
            return redirect('website:loginPaciente', permanent=True)

        else:
            return redirect(request, 'website/login.html')
# TESTE DE LINK


def pacienteIndex(request):
    return render(request, 'website/paciente.html')

# CADASTRO DE USUÁRIO


def cadastroUsers(request):
    return render(request, 'website/cadastroUsers.html')
