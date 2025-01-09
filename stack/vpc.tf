module "vpc" {
  source = "../modules/vpc/"
  cidr_block = "10.0.0.0/16"
  vpc_name  = "MyVPC"
}

# module "subnet" {
#   source = "/home/ncs/khush/vpc"
#   cidr_block_subnet = "10.0.1.0/24"
#   availability_zone  = "ap-southeast-2a"
# }
# module "routtable" {
#   source         = "../vpc"
#   routtable_name  = "MyRouteTable"
# }

# module "ec2" {
#   source = "/home/ncs/khush/vpc"
#   instance_type= "t2.micro" 
# }
