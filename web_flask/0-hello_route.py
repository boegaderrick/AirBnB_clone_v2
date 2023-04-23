#!/usr/bin/python3
# This script starts a simple flask web application
from flask import Flask
app = Flask(__name__)


@app.route('/', strict_slashes=False)
def hello():
    return 'Hello HBNB!'
