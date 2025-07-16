#!/bin/bash
yum update -y
amazon-linux-extras enable php8.0 mariadb10.5
yum clean metadata
yum install -y php php-mysqlnd mariadb unzip httpd wget

systemctl start httpd
systemctl enable httpd
systemctl start mariadb
systemctl enable mariadb

cd /var/www/html
wget https://wordpress.org/latest.zip
unzip latest.zip
cp -r wordpress/* .
rm -rf wordpress latest.zip
chown -R apache:apache /var/www/html

# Preconfigure database
mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'YourStrongPassword';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

# Configure wp-config.php
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/wordpress/" wp-config.php
sed -i "s/username_here/wpuser/" wp-config.php
sed -i "s/password_here/YourStrongPassword/" wp-config.php
sed -i "s/localhost/127.0.0.1/" wp-config.php

systemctl restart httpd
