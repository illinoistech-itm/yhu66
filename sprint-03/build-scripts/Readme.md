# Build Scripts for Automation

#!/bin/bash
set -e
set -v

sudo apt-get update
export DEBIAN_FRONTEND=noninteractive
echo mysql-apt-config mysql-apt-config/enable-repo select mysql-8.0 | sudo debconf-set-selections
wget -c https://repo.mysql.com//mysql-apt-config_0.8.13-1_all.deb
sudo dpkg --install mysql-apt-config_0.8.13-1_all.deb
sudo systemctl status mysql
sudo systemctl enable mysql

echo -e "[mysqld]" > /root/.my.cnf
echo -e "\n\n[client]\nuser = root\npassword = $DBPASS" >> /root/.my.cnf
echo -e "\nport = 3306\nsocket = /var/run/mysqld/mysqld.sock\n" >> /root/.my.cnf

echo -e "[mysqld]" > /home/vagrant/.my.cnf.user
echo -e "\n\n[client]\nuser = worker\npassword = $USERPASS" >> /home/vagrant/.my.cnf.user
echo -e "\nport = 3306\nsocket = /var/run/mysqld/mysqld.sock\n" >> /home/vagrant/.my.cnf.user
echo -e "\ndefault-character-set = utf8mb4\n" >> /home/vagrant/.my.cnf.user

# Set system hostname
sudo hostnamectl set-hostname sample-server

sudo chown -R vagrant:vagrant ~/tnikolova/2021-team-sample

# Using sed to replace variables in the scripts with the ENV variables passed
sed -i "s/\$ACCESSFROMIP/127.0.0.1/g" ~/tnikolova/2021-team-sample/sprint-02/code/db-samples/*.sql
sed -i "s/\$USERPASS/$USERPASS/g" ~/tnikolova/2021-team-sample/sprint-02/code/db-samples/*.sql
sed -i "s/\$MMIP/127.0.0.1/g" ~/tnikolova/2021-team-sample/sprint-02/code/db-samples/*.sql
# This script will create the database named posts in the mariadb server
sudo mysql -u root < ~/tnikolova/2021-team-sample/sprint-02/code/db-samples/create-database.sql
# This script will create the table named comments
sudo mysql -u root < ~/tnikolova/2021-team-sample/sprint-02/code/db-samples/create-table.sql
# This script will create the non-root user named worker and the user for replication
sudo mysql -u root < ~/tnikolova/2021-team-sample/sprint-02/code/db-samples/create-user-with-permissions-mm.sql
# This script will insert 3 sample records to the table
sudo mysql -u root < ~/tnikolova/2021-team-sample/sprint-02/code/db-samples/insert-records.sql
# This script will select * from comments and print the contents to the screen to make sure it all worked
sudo mysql -u root < ~/tnikolova/2021-team-sample/sprint-02/code/db-samples/sample-select.sql

# Enable Firewall
# https://serverfault.com/questions/809643/how-do-i-use-ufw-to-open-ports-on-ipv4-only
# DBIP is configured in the packer environment variables to allow access from a variable IP
# https://serverfault.com/questions/790143/ufw-enable-requires-y-prompt-how-to-automate-with-bash-script
ufw --force enable
ufw allow proto tcp to 0.0.0.0/0 port 22
# For nodejs app default port
ufw allow 3000
ufw allow from $FIREWALLACCESS to any port 3306

sudo apt-get update
sudo apt install python-pip
