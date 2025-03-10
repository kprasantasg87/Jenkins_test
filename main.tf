terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.90.0"  # Change this to 5.x if needed
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "awsinstance1" {
  ami                         = "ami-0b5a4445ada4a59b1"
  instance_type               = "t2.micro"
  associate_public_ip_address = true

}

