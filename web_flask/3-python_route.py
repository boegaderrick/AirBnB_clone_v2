#!/usr/bin/python3
"""This script starts a simple flask web application"""
from flask import Flask, escape
app = Flask(__name__)


@app.route('/', strict_slashes=False)
def hello():
    """This function displays a text"""
    return 'Hello HBNB!'


@app.route('/hbnb', strict_slashes=False)
def hbnb():
    """This function displays a text"""
    return 'HBNB'


@app.route('/c/<text>', strict_slashes=False)
def c_text(text):
    """This function takes a variable and displays text containing it"""
    return 'C {}'.format(escape(text).replace("_", " "))


@app.route('/python/', strict_slashes=False, defaults={'text': 'is_cool'})
@app.route('/python/<text>')
def python_text(text):
    """This function takes a variable and displays text containing it"""
    return 'Python {}'.format(escape(text).replace("_", " "))


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
