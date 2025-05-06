#!/bin/bash

# Update packages
apt update && apt upgrade -y

# Install dependencies
apt install -y nginx mysql-client unzip curl git software-properties-common

# Install PHP 8.2 and required extensions
add-apt-repository ppa:ondrej/php -y
apt update
apt install -y php8.2 php8.2-cli php8.2-mbstring php8.2-xml php8.2-bcmath php8.2-curl php8.2-mysql php8.2-zip php8.2-gd

# Install Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt install -y nodejs

# Install Nginx
ufw allow OpenSSH
ufw allow 'Nginx Full'
ufw --force enable
systemctl enable nginx


mkdir -p /var/www/laravel
mkdir -p /var/www/nodeapp1
mkdir -p /var/www/nodeapp2
