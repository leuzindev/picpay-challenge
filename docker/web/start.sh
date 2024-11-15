#!/bin/bash

echo "$PORT_APP"
echo "$DEBUG"

export PYTHONPATH="/code:$PYTHONPATH"

python /code/manage.py migrate --noinput

gunicorn --bind :"$PORT_APP" --config docker/web/gunicorn.$ENVIRONMENT.py picpay.wsgi:application --log-level=debug
