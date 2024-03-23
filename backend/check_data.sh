#!/bin/bash

if python -c "import sys; from users.models import CustomUser; sys.exit(0 if CustomUser.objects.exists() else 1)"; then
    echo "Database is populated, skipping loaddata."
else
    echo "Database is empty, running loaddata."
    python ./manage.py loaddata ./population/01_Users.json ./population/02_Products.json
fi
