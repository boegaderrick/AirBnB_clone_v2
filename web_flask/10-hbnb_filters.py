#!/usr/bin/python3
"""This script starts a simple flask web application"""
from flask import Flask, escape, render_template
app = Flask(__name__)


@app.route('/hbnb_filters', strict_slashes=False)
def states():
    """ This function renders a html page containing list of
        states
    """
    states = storage.all(State).values()
    cities = storage.all(City).values()
    amenities = storage.all(Amenity).values()
    return render_template('10-hbnb_filters.html', states=states,
                           cities=cities, amenities=amenities)


@app.teardown_appcontext
def teardown(Exception=None):
    """This function closes an sqlalchemy session"""
    storage.close()


if __name__ == '__main__':
    from models import storage
    from models.state import State
    from models.city import City
    from models.amenity import Amenity
    app.run(host='0.0.0.0', port=5000)
