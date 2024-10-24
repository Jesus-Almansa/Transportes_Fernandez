# app/__init__.py
from flask import Flask

app = Flask(__name__)

# Importar las rutas
from app import routes

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)