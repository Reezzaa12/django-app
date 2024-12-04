# Basbild
FROM python:3.10-slim

# Arbetskatalog i containern
WORKDIR /usr/src/app

# Kopiera beroenden till containern
COPY requirements.txt .

# Installera beroenden
RUN pip install --no-cache-dir -r requirements.txt

# Kopiera projektfilerna
COPY . .

# Exponera port 8000
EXPOSE 8000

# Starta Django-devserver som standard
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]