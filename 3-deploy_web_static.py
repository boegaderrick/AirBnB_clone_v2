#!/usr/bin/python3
"""This script compresses html files and deploys them"""
from fabric.api import run, put, env, local
from datetime import datetime

env.hosts = ['web-01.boegaderrick.tech', 'web-02.boegaderrick.tech']
env.user = 'ubuntu'


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


def deploy():
    """
        This function calls two fuctions that are imported from two separate
        modules at the top of this script.
        'do_pack' is called first, and its return is passed to 'do_deploy'
        'do_deploy' is then called and its return value gets returned by this
        function.
    """
    return do_deploy(do_pack())
