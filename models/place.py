#!/usr/bin/python3
""" Place Module for HBNB project """
from models.base_model import BaseModel, Base
from sqlalchemy import Column, String, Integer, Float, ForeignKey, Table
from sqlalchemy.orm import relationship
from os import getenv

place_amenity = Table('place_amenity', Base.metadata,
                      Column('place_id', ForeignKey('places.id')),
                      Column('amenity_id', ForeignKey('amenities.id'))
                      )


class Place(BaseModel, Base):
    """ A place to stay """
    if getenv('HBNB_TYPE_STORAGE') == 'db':
        __tablename__ = 'places'
        city_id = Column(String(60), ForeignKey('cities.id'), nullable=False)
        user_id = Column(String(60), ForeignKey('users.id'), nullable=False)
        name = Column(String(128), nullable=False)
        description = Column(String(1024))
        number_rooms = Column(Integer, nullable=False, default=0)
        number_bathrooms = Column(Integer, nullable=False, default=0)
        max_guest = Column(Integer, nullable=False, default=0)
        price_by_night = Column(Integer, nullable=False, default=0)
        latitude = Column(Float)
        longitude = Column(Float)
        reviews = relationship('Review', backref='place', cascade='delete')
        amenities = relationship('Amenity', back_populates='place_amenities',
                                 viewonly=False, secondary=place_amenity)
    else:
        city_id = ""
        user_id = ""
        name = ""
        description = ""
        number_rooms = 0
        number_bathrooms = 0
        max_guest = 0
        price_by_night = 0
        latitude = 0.0
        longitude = 0.0
        amenity_ids = []

        @property
        def reviews(self):
            """
                FileStorage getter method for Review objects associated
                with current Place object
            """
            from models import storage
            from models.review import Review
            reviews = storage.all(Review)
            return [obj for obj in reviews.values() if obj.place_id == self.id]

        @property
        def amenities(self):
            """Getter method for amenities associated with current object"""
            from models import storage
            from models.amenity import Amenity
            objs = storage.all(Amenity).values()
            return [obj for obj in objs if obj.id in self.amenity_ids]

        @amenity.setter
        def amenities(self, obj):
            """Setter method for amenity_ids attribute"""
            if type(obj).__name__ == 'Amenity':
                self.amenity_ids.append(obj.id)
