#!/bin/bash
echo "Updating the system..."
sudo apt-get update -y

echo "Cloning the repository..."
git clone https://github.com/khushpardhi/wanderlust.git /home/ubuntu/wanderlust

cd wanderlust/ansible/
ansible-playbook main.yml
