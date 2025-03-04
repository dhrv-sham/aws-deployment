#!/bin/bash

# Update package lists
sudo apt update -y

# Install Apache
sudo apt install -y apache2

# Ensure Apache starts on boot
sudo systemctl enable apache2
sudo systemctl start apache2

# Allow HTTP traffic through the firewall
sudo ufw allow 80/tcp
sudo ufw reload

# Remove default Apache index page
sudo rm -f /var/www/html/index.html

# Create a new index.html file
cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Apache Server</title>
</head>
<body>
    <h1>Hello from Ubuntu Apache Server!</h1>
    <p>This page is served from an EC2 instance running Apache.</p>
</body>
</html>
EOF

# Restart Apache to apply changes
sudo systemctl restart apache2
