FROM python:3.11-slim

WORKDIR /app

# system deps
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     build-essential \
#  && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# Start the app with gunicorn (production WSGI server)
# 'main:app' refers to app object in main.py
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
