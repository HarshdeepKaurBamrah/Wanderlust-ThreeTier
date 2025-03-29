variable "instance_type" {
  type = string
  description = "describe your variable"
  default = "t2.micro"
}
variable "instance_Name" {
  type = string
  description = "describe your variable"
  default = "my_ec2"
}

variable "ec2_sg_id" {}

variable "ec2_subnet_id" {}
