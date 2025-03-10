

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "awsinstance1" {
  ami                         = "ami-0b5a4445ada4a59b1"
  instance_type               = "t2.micro"
  associate_public_ip_address = true

}

