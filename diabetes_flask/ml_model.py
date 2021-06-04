import pickle
import pandas as pd

# load pickle model
with open('diabetes_ridge_model.pickle', 'rb') as f:
    model = pickle.load(f)

def predict_level(data_dict):
    # convert input dictionary into data frame
    df = pd.DataFrame([data_dict])

    # make predictions
    prediction = model.predict(df)

    return prediction

    
    