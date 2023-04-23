#!/usr/bin/python3
"""This script starts a simple flask web application"""
from flask import Flask, escape, render_template
from models import storage
from models.state import State
from models.city import City
app = Flask(__name__)


@app.route('/cities_by_states', strict_slashes=False)
def cities_by_states():
    """ This function renders a html page containing list of
        states and cities
    """
    states = storage.all(State).values()
    cities = storage.all(City).values()
    return render_template('8-cities_by_states.html', states=states,
                           cities=cities)


@app.teardown_appcontext
def teardown(Exception=None):
    """This function closes an sqlalchemy session"""
    storage.close()


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
