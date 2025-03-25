# Use Python 3.10 to match networkx requirements
FROM python:3.10

# Set the working directory
WORKDIR /app

# Copy all project files into the container
COPY . .

# Upgrade pip before installing dependencies
RUN pip install --upgrade pip

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port your Flask app runs on (default 5000)
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]
