terraform {
  backend "s3" {
    bucket = "terastate1" 
    key    = "terastate1/tfstate-store/terraform.tfstate"
    region = "ap-southeast-2"
  }
}


	
