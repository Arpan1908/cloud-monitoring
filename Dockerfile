FROM python:3.9-slim-buster

# Set the working directory

WORKDIR /app

# Copy the current directory contents into the container at /app

COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN apt-get update && apt-get install -y \
  build-essential python3-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN pip install --no-binary :all: --compile psutil
RUN  pip install --no-cache-dir --upgrade pip  &&  pip install -U setuptools && pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app

COPY . .

ENV FLASK_HOST=0.0.0.0

EXPOSE 5000

CMD ["python3", "app.py"]