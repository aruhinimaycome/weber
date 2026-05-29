FROM python:3.12-slim
LABEL maintainer="Docker Education Team <education@docker.com>"

WORKDIR /opt/webapp

COPY ./webapp/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ./webapp .

EXPOSE 5000
CMD ["python", "app.py"]
