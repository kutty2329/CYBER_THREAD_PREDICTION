# Use Python 3.9
FROM python:3.9

# Set working directory
WORKDIR /app

# Copy files
COPY . .

# Upgrade pip
RUN pip install --upgrade pip

# Manually install networkx first
RUN pip install "networkx<3.4"

# Install other dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose Flask port
EXPOSE 5000

# Run Flask app
CMD ["python", "app.py"]
