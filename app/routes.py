from flask import render_template, request, jsonify
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
   return render_template("frontpage.html")

@app.route('/hello')
def hello_world():
    return 'Hello, World!'
    
@app.route('/test', methods=["GET"])
def test():

   return {"test":"hola amigo"}
   
@app.route('/test', methods=["POST"])
def puestada():

   return {"test":"ESTE ES EL POST"}
   
@app.route('/train', methods=["GET"])
def train():
   data = request.json
   print("AAAAAAAAAAAAAAAAAAAAAAAAAA")
   print(data.get("hola"))
   return jsonify(data)
   

if __name__ == '__main__':
    app.run(debug=True)

