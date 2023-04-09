#!/usr/bin/python3
"""This module contains a function that deploys a site"""
from fabric.api import run, put, env
env.hosts = ['web-01.boegaderrick.tech', 'web-02.boegaderrick.tech']
env.user = 'ubuntu'


def do_deploy(archive_path):
    """
        Using fabric, this function deploys an archive containing
        html files of a static site to remote servers specified
        in the env attribute of fabric.api.

        The archive is stored temporarily in the '/tmp' directory of
        the remote servers after which a new directory of the same
        name as the archive without the '.tgz' extension is created
        in '/data/web_static/releases/'.

        The archive's contents are then extracted to the new directory
        and then deleted from the servers.

        Finally the function creates a symbolic link '/data/web_static/current'
        linked to the directory containing the unpacked html files.

        [True] is returned on success
        [False] is returned upon failure in performing the mentioned operations
        or if the value passed to the function is not a valid path to the
        archive.
    """
    if archive_path is None:
        return False
    put(archive_path, '/tmp')
    remote_arcpath = archive_path.replace('versions', '/tmp')
    decomp_path = '/data/web_static/releases/' + remote_arcpath.\
        replace('/tmp/', '').replace('.tgz', '')
    try:
        run('mkdir -p {}'.format(decomp_path))
        run('tar -xzf {} -C {}'.format(remote_arcpath, decomp_path))
        run('rm {}'.format(remote_arcpath))
        run('rm -rf /data/web_static/current')
        run('ln -s {} /data/web_static/current'.format(decomp_path))
    except Exception:
        return False

    return True
