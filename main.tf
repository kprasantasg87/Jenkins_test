provider "aws" {
region =  "ap-southeast-1"
}
resource aws_vpc "VPC"{
  cidr_block="10.0.0.0/24"
}

resource aws_subnet "SUBNET"{
  vpc_id=aws_vpc.VPC.id
  cidr_block="10.0.0.16/28"
  availability_zone="ap-southeast-1a"

}
resource aws_internet_gateway "IGW"{
  vpc_id=aws_vpc.VPC.id
}
resource aws_route_table "RT"{
  vpc_id=aws_vpc.VPC.id
  route{
    gateway_id=aws_internet_gateway.IGW.id
    cidr_block="0.0.0.0/0"
  }  
}
resource aws_route_table_association "ARTA"{
  subnet_id=aws_subnet.SUBNET.id
  route_table_id = aws_route_table.RT.id
}
resource aws_security_group "SG"{
  description="SG"
  vpc_id=aws_vpc.VPC.id
  ingress{
    description = "httpd"
    from_port=80
    to_port=80
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
  }
  ingress{
    description="ssh"
    from_port="22"
    to_port="22"
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
  }
  egress{
    from_port = 0
    to_port=0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource aws_instance "instance"{
  ami="ami-0672fd5b9210aa093"
  instance_type="t2.micro"
  key_name="EBS-VOL"
  subnet_id = aws_subnet.SUBNET.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.SG.id]
  tags={
    name="instance"
  }
user_data = <<-EOF
  #!/bin/bash
  sudo apt-get update -y
  sudo apt-get install ansible -y
  sudo apt-get install git -y
  cd /home/ubuntu
  sudo git clone https://github.com/kprasantasg87/Jenkins_test.git 
  sudo ansible-playbook /home/ubuntu/Jenkins_test/httpd.yml
 
EOF
}
