
terraform{
required_providers{
aws={
source = "hashicorp/aws"
version = "~>4.0"
}
}
}
provider aws {
    region="ap-south-1"
  
}

resource "aws_instance" "awsinstance1" {
  ami                         = "ami-099b3d23e336c2e83"
  instance_type               = "t2.micro"
   associate_public_ip_address = true
  availability_zone           = "ap-south-1a"
  
  
}


