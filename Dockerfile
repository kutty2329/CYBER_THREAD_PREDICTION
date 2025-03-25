# Use an official Python image (Updated to Python 3.12)
FROM python:3.12

# Set the working directory in the container
WORKDIR /app

# Copy all project files into the container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port your Flask app runs on (default 5000)
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]
