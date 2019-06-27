FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /test
WORKDIR /test
COPY requirements.txt /test/

COPY . /test/
