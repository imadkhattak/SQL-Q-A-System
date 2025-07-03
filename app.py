from flask import Flask, request, jsonify, render_template
from main import get_bot_answer 

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def home():
    if request.method == 'POST':
        data = request.get_json() or request.form
        question = data.get('question', '')
        answer = get_bot_answer(question)
        return jsonify({'answer': answer})
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True, port=5000, host='127.0.0.1')