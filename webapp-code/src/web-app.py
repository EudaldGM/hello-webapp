from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/hello')
def hello():
    return jsonify(hello='world')
app.run(host='0.0.0.0', port=81)
