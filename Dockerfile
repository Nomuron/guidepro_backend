FROM python:3.9.18-slim-bookworm

WORKDIR /app

EXPOSE 5000

COPY ./requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT ["flask", "--app", "src/app.py", "run", "--host=0.0.0.0"]