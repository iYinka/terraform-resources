#!/bin/bash
yum install wget unzip httpd -y
systemctl start httpd
systemctl enable httpd
wget https://www.tooplate.com/live/2135_mini_finance
# unzip -o 2117_infinite_loop.zip
# cp -r 2117_infinite_loop/* /var/www/html/
systemctl restart httpd




# wget https://www.tooplate.com/zip-templates/2117_infinite_loop.zip
