#!/bin/bash 
set -e
set -v

#Install PIP
#Install pre-reqs
sudo apt install -y python3-pip
python3 -m pip install --upgrade pip

#Django installs
python3 -m pip install Django
python3 -m pip install --upgrade Pillow #Library for images interface with DB

#Start Server
#sudo mv <path to website>/secert_key.txt /etc/secert_key.txt
#python3 ~/yhu66/sprint-02/code/website/src/manage.py runserver