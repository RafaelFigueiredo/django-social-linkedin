FROM python:3-buster

RUN apt-get update && apt-get install curl
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

WORKDIR /app


# You will need this if you need PostgreSQL, otherwise just skip this
# RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev libffi-dev

COPY ./requirements.txt .
RUN pip install uwsgi
RUN pip install -r requirements.txt

COPY ./django_cv .
ENV PORT=8000
EXPOSE 8000
# Runner script here
ENTRYPOINT [ "python3", "/app/manage.py","runserver", "0.0.0.0:8000" ]
# CMD ["sh", "/app/runner.sh"]