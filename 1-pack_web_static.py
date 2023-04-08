#!/usr/bin/python3
"""This module contains a fab task"""
from fabric.api import local
from datetime import datetime


def do_pack():
    """
        This function creates a directory named versions then
        packs the contents of 'web_static' directory to a '.tgz' archive
        of the same name concatenated to the current date and time
        in the created directory.

        The path to the archive is returned on success (indicated by
        '0' in the value of the return_code attribute of the returned
        result object), 'None' is returned in case of failure.
    """
    date = datetime.now().strftime('%Y%m%d%H%M%S')
    commands = 'mkdir -p versions && cd web_static &&\
        tar -czvf ../versions/web_static_{}.tgz *'.format(date)
    result = local(commands)
    if result.return_code == 0:
        return 'versions/web_static_{}.tgz'.format(date)
    return None
