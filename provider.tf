terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket = "terraform-states"
    key    = "postgres/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region   = "us-east-1"
}
