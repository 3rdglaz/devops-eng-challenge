#vpc,s3-tfstate
terraform {
  required_version = ">=1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.1"
    }
  }
  # backend "s3" {
  #   bucket = "noticias-nuvem-remote-state"
  #   key    = "noticias-nuvem-terraform/remote-state"
  #   region = "us-east-1"
  # }
}
provider "aws" {
  region = "us-east-2"
}
module "wp-content" {
  source      = "./modules/s3/"
  bucket-name = "wp-content"
}
module "vpc" {
  source = "./modules/network/"
}

module "auto-scalling" {
  source = "./modules/auto-scalling/"
}
module "rds" {
  source = "./modules/rds/"
}