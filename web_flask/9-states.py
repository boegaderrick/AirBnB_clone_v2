#!/usr/bin/python3
"""This script starts a simple flask web application"""
from flask import Flask, escape, render_template
app = Flask(__name__)


@app.route('/states', strict_slashes=False)
def states():
    """ This function renders a html page containing list of
        states
    """
    states = storage.all(State).values()
    cities = storage.all(City).values()
    return render_template('7-states_list.html', states=states,
                           cities=cities)


@app.route('/states/<id>', strict_slashes=False)
def stateCity(id):
    """ This function renders a html page containing a state
        specified by the 'id' parameter and a list of it's
        cities stored in the database. If no state is associated
        with the 'id' parameter a 404 page is rendered.
    """
    state = storage.all(State).get('State.' + id)
    cities = storage.all(City).values()
    return render_template('9-states.html', id=id, state=state, cities=cities)


@app.teardown_appcontext
def teardown(Exception=None):
    """This function closes an sqlalchemy session"""
    storage.close()


if __name__ == '__main__':
    from models import storage
    from models.state import State
    from models.city import City
    app.run(host='0.0.0.0', port=5000)
