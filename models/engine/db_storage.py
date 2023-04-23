#!/usr/bin/python3
"""This module contains a database storage class"""
from os import getenv
from models.base_model import Base
from sqlalchemy import create_engine
from models.user import User
from models.state import State
from models.city import City
from models.amenity import Amenity
from models.place import Place
from models.review import Review


class DBStorage:
    """Database storage class definition"""
    __engine = None
    __session = None

    def __init__(self):
        """DBStorage object instantiation"""
        user = getenv('HBNB_MYSQL_USER')
        password = getenv('HBNB_MYSQL_PWD')
        host = getenv('HBNB_MYSQL_HOST')
        database = getenv('HBNB_MYSQL_DB')
        string = f'mysql+mysqldb://{user}:{password}@{host}/{database}'
        self.__engine = create_engine(string, pool_pre_ping=True)
        if getenv('HBNB_ENV') == 'test':
            Base.metadata.drop_all(self.__engine)

    def close(self):
        """This method discards a session object"""
        self.__session.remove()

    def new(self, obj):
        """This method adds an object to the database"""
        self.__session.add(obj)

    def save(self):
        """This method saves changes to the database"""
        self.__session.commit()

    def delete(self, obj=None):
        """This method deletes an object from the database"""
        if obj:
            self.__session.delete(obj)

    def reload(self):
        """
            Maps all classes to corresponding tables
            in the database and opens a session
        """
        from sqlalchemy.orm import sessionmaker, scoped_session
        Base.metadata.create_all(self.__engine)
        factory = sessionmaker(bind=self.__engine, expire_on_commit=False)
        self.__session = scoped_session(factory)()

    def all(self, cls=None):
        """Returns dict of objects of specified class or all"""
        dictionary = {}
        classes = self.stored_classes(cls)
        for _class in classes:
            objs = self.__session.query(_class).all()
            for obj in objs:
                try:
                    del obj.__dict__['_sa_instance_state']
                except Exception:
                    pass
                key = type(obj).__name__ + '.' + obj.id
                dictionary.update({key: obj})
        return dictionary

    def stored_classes(self, cls=None):
        """Reference method for available classes"""
        classes = {'User': User, 'State': State, 'City': City,
                   'Amenity': Amenity, 'Place': Place, 'Review': Review}
        if cls:
            if type(cls) == str:
                return [classes[cls]]
            return [classes[cls.__name__]]
        return classes.values()
