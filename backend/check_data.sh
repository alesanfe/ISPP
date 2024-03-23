#!/bin/bash

# Set up Django environment
export DJANGO_SETTINGS_MODULE=main.settings
export PYTHONPATH=/home/app/webapp

# Wait until Django is ready to avoid AppRegistryNotReady error
until python -c "import django; django.setup()" 2>/dev/null; do
  echo "Waiting for Django to be ready..."
  sleep 2
done

# Check if data is loaded
if python -c "import sys; from users.models import CustomUser; sys.exit(0 if CustomUser.objects.exists() else 1)"; then
    echo "Database is populated, skipping loaddata."
else
    echo "Database is empty, running loaddata."
    python ./manage.py loaddata ./population/01_Users.json ./population/02_Products.json
fi

