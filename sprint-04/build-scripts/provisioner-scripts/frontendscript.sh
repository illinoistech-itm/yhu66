#!/bin/bash 
set -e
set -v

# http://superuser.com/questions/196848/how-do-i-create-an-administrator-user-on-ubuntu
# http://unix.stackexchange.com/questions/1416/redirecting-stdout-to-a-file-you-dont-have-write-permission-on
# This line assumes the user you created in the preseed directory is vagrant
echo "%admin  ALL=NOPASSWD: ALL" | sudo tee -a /etc/sudoers.d/init-users
sudo groupadd admin
sudo usermod -a -G admin vagrant

# Installing vagrant keys
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
#sudo mkdir -p /home/vagrant/.ssh
sudo chown -R vagrant:vagrant /home/vagrant/.ssh
cat ./vagrant.pub >> /home/vagrant/.ssh/authorized_keys
sudo chown -R vagrant:vagrant /home/vagrant/.ssh/authorized_keys
echo "All Done!"



##################################################
# Add User customizations below here
##################################################

sudo apt-get update
sudo apt-get install -y nginx fail2ban git

## enable firewall
ufw --force enable
ufw allow proto tcp to 0.0.0.0/0 port 22
ufw allow proto tcp to 0.0.0.0/0 port 80
ufw allow proto tcp to 0.0.0.0/0 port 443
ufw allow proto tcp to 0.0.0.0/0 port 3000

# set the /etc/hosts file to match hostname
echo "192.168.33.33      frontend    frontend.example"    | sudo tee -a /etc/hosts
echo "192.168.33.34      db    db.example"    | sudo tee -a /etc/hosts

# Set hostname
sudo hostnamectl set-hostname frontend


####Install all your frameworks
#Install PIP
#Install pre-reqs
sudo apt install -y python3-pip
python3 -m pip install --upgrade pip

sudo apt-get install -y python3-dev
sudo apt-get install -y default-libmysqlclient-dev
sudo apt-get install -y build-essential
python3 -m pip install mysqlclient


echo "[client]" >> /home/vagrant/.my.cnf
echo "host = 192.168.33.34" >> /home/vagrant/.my.cnf
echo "user = vagrant" >> /home/vagrant/.my.cnf
echo "password = " >> /home/vagrant/.my.cnf
echo "database = my_db" >> /home/vagrant/.my.cnf


#Django installs
python3 -m pip install Django
python3 -m pip install --upgrade Pillow #Library for images interface with DB


sudo mv ~/2021-team02t/sprint-03/code/website/secret_key.txt /etc/secret_key.txt
sudo rm -r ./2021-team02t/sprint-03/code/website/static_root

python3 ~/2021-team02t/sprint-03/code/website/src/manage.py migrate
sudo python3 ~/2021-team02t/sprint-03/code/website/src/manage.py collectstatic
#Start Server
#python3 ~/2021-team02t/sprint-03/code/website/src/manage.py runserver 0.0.0.0:3000