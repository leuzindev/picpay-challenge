from django.contrib.auth.models import AbstractUser, PermissionsMixin
from django.db import models

from account.managers import UserManager


class User(AbstractUser, PermissionsMixin):
    cnpj_cpf = models.CharField(
        'CNPJ/CPF',
        max_length=20,
        unique=True,
    )

    objects = UserManager()

    # def save(self, *args, **kwargs):
    #     if self.pk is None or self._password is not None:
    #         self.set_password(self.password)
    #     super().save(*args, **kwargs)

