#!/bin/bash
# Update package list
sudo apt update -y

# Install Docker
sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker

# Install Apache
sudo apt install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2

# Create a simple HTML file for Apache
echo "<h1>Welcome to My EC2 Instance</h1><p>Apache and Docker are installed!</p>" | sudo tee /var/www/html/index.html

# Restart Apache to apply changes
sudo systemctl restart apache2
