 
#!/bin/bash

# Linux Server Hardening Script
# Author: Jobdm
# GitHub: https://github.com/jobdm/linux-server-hardening
# Tested on: Ubuntu 24.04

echo "Starting Linux Server Hardening Process..."

# 1. Update and Upgrade Packages
echo "Updating and upgrading system packages..."
sudo apt update && sudo apt upgrade -y

# 2. Create a New Sudo User
read -p "Enter a new sudo username: " username
sudo adduser $username
sudo usermod -aG sudo $username
echo "$username added as a sudo user."

# 3. SSH Hardening
echo "Hardening SSH..."
sudo sed -i 's/^#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/^#Port 22/Port 2222/' /etc/ssh/sshd_config
sudo systemctl restart sshd
echo "SSH hardened. Root login disabled, password authentication disabled, and port changed to 2222."

# 4. Configure UFW Firewall
echo "Configuring firewall..."
sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 2222/tcp  # Allow SSH on new port
sudo ufw allow 80/tcp     # Allow HTTP
sudo ufw allow 443/tcp    # Allow HTTPS
sudo ufw enable
echo "Firewall configured and enabled."

# 5. Install and Configure Fail2Ban
echo "Installing and configuring Fail2Ban..."
sudo apt install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
echo "Fail2Ban installed and running."

# 6. Enable Automatic Security Updates
echo "Enabling automatic security updates..."
sudo apt install unattended-upgrades -y
sudo dpkg-reconfigure -plow unattended-upgrades
echo "Automatic updates enabled."

# 7. Install AIDE for File Integrity Monitoring
echo "Installing AIDE..."
sudo apt install aide -y
sudo aideinit
sudo mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db
echo "AIDE initialized for file integrity monitoring."

# 8. System Auditing with Lynis
echo "Installing Lynis for security auditing..."
sudo apt install lynis -y
echo "Run 'sudo lynis audit system' to perform a security audit."

echo "Hardening complete. Please restart your server."
