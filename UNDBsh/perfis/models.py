from django.db import models
from django.contrib.auth.models import BaseUserManager, AbstractUser

#Administrador de criação de Usuarios.
class UserManager(BaseUserManager):

    def create_user(self, email, password, tipo_de_usuario):
        if not email:
            raise ValueError('Usuario precisa de um email.')
        
        user = self.model(
            email=self.normalize_email(email),
            tipo_de_usuario=tipo_de_usuario
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_staffuser(self, email, password, tipo_de_usuario):
        
        user = self.create_user(
            email,
            password,
            tipo_de_usuario
        )

        user.staff=True
        user.save(using=self._db)

    def create_superuser(self, email, password, tipo_de_usuario):

        user = self.create_user(
            email,
            password,
            tipo_de_usuario
        )
        user.staff=True
        user.admin=True
        user.save(using=self._db)


#Usuário padrão para login
class User(AbstractUser):

    username = None

    email = models.CharField(
        verbose_name='endereco de email',
        max_length=255,
        unique=True
    )
    tipo_de_usuario = models.CharField(
        verbose_name='tipo de usuario',
        max_length=255,
        null=False
    )
    is_active = models.BooleanField(default=True)
    staff = models.BooleanField(default=False)
    admin = models.BooleanField(default=False)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['tipo_de_usuario']

    def get_full_name(self):
        return self.email

    def get_short_name(self):
        return self.email
    
    def __str__(self):
        return self.email
    
    def has_perm(self, perm, obj=None):
        return True
    
    def has_module_perms(self, app_label):
        return True

    def get_tipo(self):
        return self.tipo_de_usuario

    @property
    def is_staff(self):
        return self.staff

    @property
    def is_admin(self):
        return self.staff

    objects = UserManager()

#aqui vai ficar a área de cadastro de usuários