#!/usr/bin/python3
"""This script starts a simple flask web application"""
from flask import Flask, escape, render_template
app = Flask(__name__)


@app.route('/hbnb', strict_slashes=False)
def hbnb():
    """ This function renders a clone airbnb home page"""
    states = storage.all(State).values()
    cities = storage.all(City).values()
    amenities = storage.all(Amenity).values()
    return render_template('100-hbnb.html', states=states,
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
