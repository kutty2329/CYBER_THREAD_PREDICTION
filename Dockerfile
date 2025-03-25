# Use an official Python image
FROM python:3.9

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
