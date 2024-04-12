#!/bin/bash
echo "*** Installing apache2"
sudo dnf update -y
sudo dnf install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
touch /usr/local/share/apache2.test
echo "*** Completed Installing apache2"