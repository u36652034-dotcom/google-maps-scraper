# Use a lightweight Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirements first for better layer caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Create output directory (ephemeral on free plan)
RUN mkdir -p output

# Default command (override when running the job)
CMD ["python", "main.py", "--help"]
