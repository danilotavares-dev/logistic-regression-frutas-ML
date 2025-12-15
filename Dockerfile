FROM python:3.13

WORKDIR /code/app

COPY ./requiriments.txt /code/requiriments.txt

RUN pip install --no-cache-dir --upgrade -r /code/requiriments.txt

COPY ./app /code/app

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
