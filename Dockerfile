FROM python:3.9

WORKDIR /app

RUN apt update && apt -y upgrade

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "app.py"]
