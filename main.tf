provider "aws" {
region= "ap-southeast-1"
}
resource "aws_vpc" "VPC"{
cidr_block=  "10.0.0.0/24"
}

resource "aws_subnet" "SUB" {
   vpc_id = aws_vpc.VPC.id
   availability_zone = "ap-southeast-1a"
   cidr_block = "10.0.0.0/28"
}
 


resource "aws_internet_gateway" "IGW"{
   vpc_id = aws_vpc.VPC.id
}
resource "aws_route_table" "RT"{
   vpc_id = aws_vpc.VPC.id
   route{
      gateway_id =  aws_internet_gateway.IGW.id
      cidr_block = "0.0.0.0/0"
   }
   tags = {
     Name ="MYRT"
   }
}

resource "aws_route_table_association" "ARTA" {
   subnet_id = aws_subnet.SUB1.id
   route_table_id = aws_route_table.RT.id
}



resource "aws_ebs_volume" "EBS"{
   type = "gp3"
   size = 15
   availability_zone = "ap-southeast-1b"
   tags = {
      Name ="EBS"
   }
}

resource "aws_instance" "Instance"{

ami= "ami-0c50b6f7dc3701ddd"
instance_type = "t2.micro"
key_name = "EBS-VOL"
availability_zone = "ap-southeast-1a"
subnet_id = aws_subnet.SUB1.id
associate_public_ip_address =  true
   tags = {
      Name = "Instance"
   }
user_data = <<EOF
#!/bin/bash
sudo yum install nginx -y
EOF
}
