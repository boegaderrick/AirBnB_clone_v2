#!/usr/bin/python3
""" State Module for HBNB project """
from models.base_model import BaseModel, Base
from os import getenv


class State(BaseModel, Base):
    """ State class """
    if getenv('HBNB_TYPE_STORAGE') == 'db':
        from sqlalchemy import Column, String
        from sqlalchemy.orm import relationship
        __tablename__ = 'states'
        name = Column(String(128), nullable=False)
        cities = relationship('City', backref='state', cascade='delete')
    else:
        name = ''

        @property
        def cities(self):
            """
                FileStorage getter method for City objects associated
                with current State object
            """
            from models import storage
            from models.city import City
            cities = storage.all(City)
            return [obj for obj in cities.values() if obj.state_id == self.id]
