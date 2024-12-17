# Use an official Python image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Sync system clock and install system dependencies
RUN apt-get update || true && \
    apt-get install -y tzdata && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get install -y \
        gcc \
        libffi-dev \
        libssl-dev && \
    apt-get clean

# Copy the application code into the container
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Flask runs on
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]
