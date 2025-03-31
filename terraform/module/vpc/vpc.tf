# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}

# Create a Subnet
resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.cidr_block_subnet
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnet_name
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags   = {
    Name = "my_igw"
  }
}

# Create a Route Table and Route
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = var.routtable_name
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.my_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "my_route_table_assoc" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_route_table.id
}

# Create a Security Group
resource "aws_security_group" "my_sg" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}
