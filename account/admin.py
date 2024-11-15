from django.contrib import admin

from account.models import User


@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    fieldsets = (
        (None, {"fields": ("username", "password")}),
        (("Personal info"),
         {"fields": (
             "first_name",
             "last_name",
             "email",
             "cnpj_cpf",
         )}),
        (
            ("Permissions"),
            {
                "fields": (
                    "is_active",
                    "is_staff",
                    "is_superuser",
                ),
            },
        ),
        (("Important dates"), {"fields": ("last_login", "date_joined")}),
    )

    list_display = (
        "username",
        "email",
        "is_staff",
        "date_joined",
    )
