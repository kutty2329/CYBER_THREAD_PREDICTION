import pickle
import time
import numpy as np
from flask import Flask, request, render_template

app = Flask(__name__)

# Load the trained Linear Regression model
try:
    with open("X:\APPLICATION DEVELOPMENT\linear_regression_model.pkl", 'rb') as file:
        model = pickle.load(file)
except FileNotFoundError:
    raise FileNotFoundError("Model file 'linear_regression_model.pkl' not found.")
except Exception as e:
    raise RuntimeError(f"Error loading model: {e}")

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/predict', methods=['POST'])
def predict():
    try:
        # Retrieve inputs from form
        feature_names = ['protocol', 'flag', 'packet', 'sender_id', 'receiver_id',
                         'source_ip', 'dest_ip', 'source_port', 'dest_port', 'packet_size']
        
        inputs = []
        for feature in feature_names:
            value = request.form.get(feature)
            if value is None or value.strip() == "":
                return render_template('result.html', prediction=f"Invalid input for {feature}. Please enter a valid number.")
            try:
                inputs.append(float(value))
            except ValueError:
                return render_template('result.html', prediction=f"Invalid input for {feature}. Please enter a numeric value.")
        
        # Convert to numpy array and reshape for prediction
        input_data = np.array([inputs])
        
        # Measure prediction time
        start_time = time.time()
        prediction = model.predict(input_data)
        end_time = time.time()

        # Extract scalar value
        prediction = float(prediction[0])
        
        return render_template('result.html', 
                               prediction=f"Predicted Threat Level: {prediction:.2f}",
                               processing_time=f"Prediction completed in {end_time - start_time:.2f} seconds.")
    except Exception as e:
        print(f"Error occurred: {e}")
        return render_template('result.html', prediction=f"An error occurred: {str(e)}")

if __name__ == '__main__':
    app.run(debug=True)
