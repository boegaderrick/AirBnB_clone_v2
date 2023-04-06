#!/usr/bin/env bash
#This script configures a server and prepares it to serve static content

#Query path of nginx installation then check length of resulting string
#If length == 0 (indicating no installation found) install nginx
path=$(which nginx)
if (( ${#path} == 0 ))
then
        sudo apt-get update && sudo apt-get install nginx -y
fi

#Create directories if not already present
sudo mkdir -p /data/web_static/shared
sudo mkdir -p /data/web_static/releases/test

#Default html file
html="<html>\
        \n\t<head>\
        \n\t</head>\
        \n\t<body>\
        \n\t\tHolberton School\
        \n\t</body>\
\n</html>"

echo -e "$html" > index.html
sudo mv index.html /data/web_static/releases/test
sudo ln -sf /data/web_static/releases/test /data/web_static/current
sudo chown -R ubuntu:ubuntu /data

#Server block definition
#server="server {\
#        \n\tlisten localhost:80;\
#        \n\tserver_name boegaderrick.tech;\
#
#        \n\n\tlocation /hbnb_static {\
#                \n\t\talias /data/web_static/current/;\
#                \n\t\ttry_files \$uri \$uri/ =404;\
#        \n\t}\
#\n}"
#echo -e "$server" > boegaderrick.tech.conf
#sudo mv boegaderrick.tech.conf /etc/nginx/conf.d/

sudo sed -i '24i location /hbnb_static {alias /data/web_static/current/;}' /etc/nginx/sites-enabled/default
sudo service nginx restart
