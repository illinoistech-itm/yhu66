-- This file creates a user named worker and passes in the password declared in the environment variables
-- Depending on the user, you may not want CREATE and DELETE permissions
-- Website DB

Create Django user and give permissions to Website DB
CREATE DATABASE bugville DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE DATABASE my_db;

CREATE USER 'vagrant'@'localhost' IDENTIFIED BY '';
GRANT ALL ON bugville.* TO 'vagrant'@'localhost';
-- GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON posts.* TO worker@'$ACCESSFROMIP' IDENTIFIED BY '$USERPASS'; flush privileges;
GRANT SELECT,INSERT,CREATE TEMPORARY TABLES ON posts.* TO vagrant@'$ACCESSFROMIP' IDENTIFIED BY '$USERPASS'; flush privileges;

-- https://devopscube.com/setup-mysql-master-slave-replication/
-- create two accounts for each of the slave systems to connect to the master to begin replication

GRANT REPLICATION SLAVE ON *.* TO 'replicauser'@'$MS1IP' IDENTIFIED BY '$USERPASS';
GRANT REPLICATION SLAVE ON *.* TO 'replicauser'@'$MS2IP' IDENTIFIED BY '$USERPASS';

-- Create Django user and give permissions to Website DB

flush privileges;