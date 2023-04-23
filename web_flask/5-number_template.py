#!/usr/bin/python3
"""This script starts a simple flask web application"""
from flask import Flask, escape, render_template
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


@app.route('/number/<int:n>', strict_slashes=False)
def number(n):
    """This function displays '<value of n> is a number' if its an int"""
    return '{} is a number'.format(n)


@app.route('/number_template/<int:n>', strict_slashes=False)
def number_template(n):
    """This function renders a html template if n is an int"""
    return render_template('5-number.html', number=n)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
