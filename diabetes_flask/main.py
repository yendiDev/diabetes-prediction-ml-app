from flask import Flask, request, jsonify
from ml_model import predict_level

app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
    # receive json
    response = request.get_json()

    print('****************************')

    print(type(response))

    print(response)

    print('****************************')

    # convert response to diction
    response_dict = dict(response)

    # make prediction
    prediction = predict_level(response_dict)

    # prepare response data
    pred = {
        'prediction': prediction.tolist()
    }

    return jsonify(pred)

if __name__ == '__main__':
    app.run(debug=True, port=8080, host='0.0.0.0')