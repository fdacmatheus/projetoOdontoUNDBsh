from website.views import AuthenticateLogin, IndexTemplateView, LoginTemplateView, pacienteIndex, cadastroUsers
from django.urls import path

app_name = 'website'

urlpatterns = [

    path('', IndexTemplateView.as_view(), name='index'),

    path('login/', LoginTemplateView.as_view(), name='login'),

    path('login/auth/', AuthenticateLogin, name='login_authentication'),

    path('pacientes/', pacienteIndex, name='loginPaciente'),

    path('cadastro/', cadastroUsers, name='cadastro'),

]
