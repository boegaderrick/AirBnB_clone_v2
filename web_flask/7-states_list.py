#!/usr/bin/python3
"""This script starts a simple flask web application"""
from flask import Flask, escape, render_template
# from models import storage
# from models.state import State
app = Flask(__name__)


@app.route('/states_list', strict_slashes=False)
def states_list():
    """This function renders a html page containing list of states"""
    from models import storage
    from models.state import State
    states = storage.all(State).values()
    return render_template('7-states_list.html', states=states)


@app.teardown_appcontext
def teardown(Exception=None):
    """This function closes an sqlalchemy session"""
    from models import storage
    storage.close()


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
