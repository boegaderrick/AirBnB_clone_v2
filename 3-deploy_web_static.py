#!/usr/bin/python3
"""This script compresses html files and deploys them"""
from fabric.api import run, put, env
#env.hosts = ['web-01.boegaderrick.tech', 'web-02.boegaderrick.tech']
#env.user = 'ubuntu'
do_pack = __import__('1-pack_web_static').do_pack
do_deploy = __import__('2-do_deploy_web_static').do_deploy


def deploy():
    """
        This function calls two fuctions that are imported from two separate
        modules at the top of this script.
        'do_pack' is called first, and its return is passed to 'do_deploy'
        'do_deploy' is then called and its return value gets returned by this
        function.
    """
    return do_deploy(do_pack())
