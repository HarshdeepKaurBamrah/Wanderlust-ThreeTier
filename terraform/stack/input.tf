//subnet variable
variable "subnet_name" {
  type = string
  description = "this is my subnet_name"
  default = "MySubnet"
}
variable "cidr_block_subnet" {
  type = string
  description = "this is my subnet_cidir"
  default = "10.0.1.0/24"
}
variable "availability_zone" {
  type = string
  description = "this is my subnet_cidir"
  default = "ap-southeast-2a"
}

variable "security_group_name" {
  type = string
  description = "this is my routtable_name"
  default = "MySecurityGroup"
}

#variable "ec2_sg_id" {}
