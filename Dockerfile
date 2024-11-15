FROM python:3.12

ENV PYTHONUNBUFFERED 1
ENV DJANGO_ENV dev
ENV DOCKER_CONTAINER 1
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

RUN apt-get update

RUN apt-get install -y ca-certificates wget

RUN apt-get update

RUN apt-get install -y libsasl2-dev python-dev-is-python3 libldap2-dev libssl-dev libaio1 alien netcat-traditional default-jdk

RUN apt-get install -y \
    libjpeg-dev \
    libffi-dev \
    libpango1.0-dev \
    libcairo2-dev \
    libgdk-pixbuf2.0-dev \
    libgirepository1.0-dev \
    build-essential \
    python3-dev

RUN pip install --upgrade pip

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir -r /code/requirements.txt

COPY . /code/

WORKDIR /code/