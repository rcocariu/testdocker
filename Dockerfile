FROM python:3.8-alpine
MAINTAINER Rocks Strategy LLC

ENV PYTHONUNBUFFERED 1
# avoids some complications in docker with python images, avoids buffering

COPY ./requirements.txt /requirements.txt
RUN apk update
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app
# created an empty folder in the docker container and copies all our work files there

RUN adduser -D user
USER user
# -D means that user for the processes of our project, limits the scope of what an attacker can have on the docker container