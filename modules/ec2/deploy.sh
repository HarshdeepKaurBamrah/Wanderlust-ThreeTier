#!/bin/bash
echo "Updating the system..."
sudo apt-get update -y

cd /tmp

echo "Cloning the repository..."
git clone https://github.com/khushpardhi/wanderlust.git /home/ubuntu/wanderlust

cat tmp

echo "Installing dependencies..."
sudo apt install -y software-properties-common python3-pip

echo "Adding Ansible PPA..."
sudo add-apt-repository ppa:ansible/ansible -y

echo "Updating package list again..."
sudo apt update

echo "Installing Ansible..."
sudo apt install -y ansible

echo "Verifying Ansible installation..."
ansible --version

cd wanderlust/ansible/
ansible-playbook main.yml
