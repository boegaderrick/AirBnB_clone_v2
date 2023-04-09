#!/usr/bin/python3
"""This module contains a function that deletes unwanted archives"""
from fabric.api import local, run, env

env.hosts = ['web-01.boegaderrick.tech', 'web-02.boegaderrick.tech']
env.user = 'ubuntu'

def do_clean(number=0):
    """
        This function performs a deletion of files in specified local
        and remote directories containing html files.
        It takes an argument 'number' that indicates how many of the
        newest directories to leave behind. If zero or no value is passed
        the function deletes all but the most recent directory.
    """
    number = int(number) if int(number) > 0 else 1
    res = local('ls -t versions/', capture=True).stdout.split('\n')[number:]

    for i in res:
        run('rm -rf /data/web_static/releases/{}'.format(i.replace('.tgz', '')))
        local('rm -f versions/{}'.format(i))
