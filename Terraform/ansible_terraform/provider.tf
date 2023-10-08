# Configure terraform 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.19.0"


    }
  }

  #    backend "s3" {
  #     bucket = "terraform-remote-backend01"
  #     key    = "dev/terraform.tfstate"
  #     region = "ap-south-1"
  #   }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "*******"
  secret_key = "******"
  # Configuration options
}
