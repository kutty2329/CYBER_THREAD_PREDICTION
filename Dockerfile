# Use Python 3.10 to match requirements
FROM python:3.10

# Set the working directory
WORKDIR /app

# Copy project files
COPY . .

# Upgrade pip before installing dependencies
RUN pip install --upgrade pip

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the Flask port
EXPOSE 5000

# Run the Flask application
CMD ["python", "app.py"]
