resource "aws_instance" "my_ec2" {
  ami           = "ami-003f5a76758516d1e"  
  instance_type = var.instance_type
  subnet_id     = var.ec2_subnet_id
  count      = 1
  vpc_security_group_ids = [
    var.ec2_sg_id
  ]
   user_data = file("${path.module}/deploy.sh")

  # # User Data for deployment
  # user_data = <<-EOF
              # #!/bin/bash
              # echo "Updating the system..."
              # sudo apt-get update -y

              # echo "Cloning the repository..."
              # git clone https://github.com/khushpardhi/wanderlust.git /home/ubuntu/wanderlust

  #             echo "Installing Docker..."
  #             sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
  #             curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  #             sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  #             sudo apt-get update -y
  #             sudo apt-get install -y docker.io
  #             docker --version

  #             echo "Starting Docker..."
  #             sudo systemctl start docker
  #             sudo systemctl enable docker

  #             echo "Installing Docker Compose..."
  #             sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  #             sudo chmod +x /usr/local/bin/docker-compose

  #             echo "Navigating to the cloned repository..."
  #             cd /home/ubuntu/wanderlust

  #             echo "Building Docker images..."
  #             sudo docker-compose build

  #             echo "Starting containers with Docker Compose..."
  #             sudo docker-compose up -d
  #             EOF

  tags = {
    Name = var.instance_Name
  }
}
