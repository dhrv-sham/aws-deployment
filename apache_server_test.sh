#!/bin/bash
# Update system packages
yes | sudo apt update
yes | sudo apt install apache2

# Create an index.html page with server details
echo "<h1>Server Details</h1>
<p><strong>Hostname:</strong> $(hostname) </p>
<p><strong>IP Address:</strong> $(hostname -I | cut -d' ' -f1)</p>" | sudo tee /var/www/html/index.html

# Restart Apache to apply changes
sudo systemctl restart apache2
