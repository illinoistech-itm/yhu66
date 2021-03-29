-- This file creates a user named worker and passes in the password declared in the environment variables
-- Depending on the user, you may not want CREATE and DELETE permissions

-- Website DB
CREATE DATABASE bugville DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE DATABASE my_db;


-- GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON posts.* TO worker@'$ACCESSFROMIP' IDENTIFIED BY '$USERPASS'; flush privileges;
GRANT SELECT,INSERT,CREATE TEMPORARY TABLES ON posts.* TO worker@'localhost' IDENTIFIED BY ''; flush privileges;



flush privileges;