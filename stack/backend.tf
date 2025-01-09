terraform {
  backend "s3" {
    bucket = "terastate1" 
    key    = "tfstate-store/terraform.tfstate"
    region = "ap-southeast-2"
  }
}


	
