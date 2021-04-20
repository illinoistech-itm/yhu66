#!/bin/bash 
set -e
set -v

#Install PIP
#Install pre-reqs
sudo apt install -y python3-pip
python3 -m pip install --upgrade pip
sudo apt-get install -y python3-dev default-libmysqlclinet-dev build-essential
python3 -m pip install mysqlclient

sudo mv 2021-team02t/code/website/secret_key.txt /etc/secret_key.txt
sudo rm -r 2021-team02t/code/website/static_root
python3 ~/2021-team02t/sprint-02/code/website/src/manage.py migrate
python3 ~/2021-team02t/sprint-02/code/website/src/manage.py collectstatic

#Django installs
python3 -m pip install Django
python3 -m pip install --upgrade Pillow #Library for images interface with DB

#Start Server
python3 ~/yhu66/sprint-04/code/website/src/manage.py runserver 0.0.0.0:3000