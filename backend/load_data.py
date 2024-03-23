import django
import os
from django.core.management import call_command

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'main.settings')
django.setup()

from users.models import CustomUser

print("Loading data")
if not CustomUser.objects.exists():
    call_command("loaddata", "./population/01_Users.json", "./population/02_Products.json")
