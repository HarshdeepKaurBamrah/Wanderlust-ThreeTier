#!/bin/bash
echo "Updating the system..."
apt-get update -y

echo "Cloning the repository..."
git clone https://github.com/khushpardhi/wanderlust.git /home/ubuntu/wanderlust

cat tmp

echo "Installing dependencies..."
apt install -y software-properties-common python3-pip

echo "Adding Ansible PPA..."
add-apt-repository ppa:ansible/ansible -y

echo "Updating package list again..."
apt-get update -y

echo "Installing Ansible..."
apt install -y ansible

echo "Verifying Ansible installation..."
ansible --version

cd /home/ubuntu/wanderlust/ansible/

ansible-playbook main.yml
