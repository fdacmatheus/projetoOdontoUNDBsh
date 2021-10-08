from django.db import models

# Create your models here.


class paciente():
    nome = models.CharField(max_length=120)
    nome_mae = models.CharField(max_length=120)
    telefone = models.CharField(max_length=12)
    celular = models.CharField(max_length=12)
