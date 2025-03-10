terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.90.0"  # Change this to 5.x if needed
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "awsinstance1" {
  ami                         = "ami-099b3d23e336c2e83"
  instance_type               = "t2.micro"
  associate_public_ip_address = true

}

