FROM python:3.11.9-alpine3.20

ENV PYTHONUNBUFFERED=1 

WORKDIR /app

RUN apk update \
    && apk add --no-cache gcc musl-dev postgresql-dev python3-dev libffi-dev \
    && pip install --upgrade pip 

COPY ./requeriments.txt ./

RUN pip install -r requeriments.txt

COPY ./ ./

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

