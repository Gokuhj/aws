# Use a small, stable base image
FROM python:3.11-slim

# Prevent Python from writing .pyc files and buffering stdout
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install build dependencies first (better caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source
COPY . .

# Expose port for Flask/Gunicorn
EXPOSE 5000

# Use gunicorn in production
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]