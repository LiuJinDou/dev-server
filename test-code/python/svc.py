from flask import Flask, request, jsonify
import addressparser

app = Flask(__name__)

# index
@app.route('/', methods=['GET'])
def index():
    return "scalper-order-service"

# transform
@app.route('/transform', methods=['POST'])
def transform():
   
    data = request.get_json()
    if len(data) == 0:
        return jsonify({'error': 'No data provided'}), 200
    print(data)
    df = addressparser.transform(data)
    print(df)
    df = df.to_json(orient='records',force_ascii=False)
    print(df)
    return jsonify(df), 200



if __name__ == '__main__':
    app.run(host='127.0.0.1',port=9999,debug=True)
