from alunos.views import AlunoIndex
from django.urls import path

app_name='alunos'

urlpatterns = [

    path('', AlunoIndex, name='aluno_index')

]