provider aws {
    region="ap-south-1"
    access_key="AKIA2YIB77KPOX23WKHU"
    secret_key="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"
}

resource aws_vpc "MVPC"{
    cidr_block="10.0.0.0/24"
}
resource aws_subnet "msub"{
    vpc_id=aws_vpc.MVPC.id
    cidr_block="10.0.0.0/25"
    availability_zone = "ap-south-1a"
}
resource aws_internet_gateway "IGW"{
    vpc_id=aws_vpc.MVPC.id
}
resource aws_route_table "RT"{
    vpc_id=aws_vpc.MVPC.id
    route{
        gateway_id=aws_internet_gateway.IGW.id
        cidr_block="0.0.0.0/0"
    }
}
resource aws_route_table_association "RTA"{
    route_table_id = aws_route_table.RT.id
    subnet_id = aws_subnet.msub.id
}




resource "aws_instance" "awsinstance1" {
  ami                         = "ami-099b3d23e336c2e83"
  instance_type               = "t2.micro"
  key_name                    = "jenkins"
  subnet_id                   = aws_subnet.msub.id
  associate_public_ip_address = true
  availability_zone           = "ap-south-1a"
  user_data= <<-EOF
  #!/bin/bash
  sudo yum install python -y
  sudo yum install git -y 
  sudo yum install ansible -y
  sudo git clone https://github.com/kprasantasg87/Jenkins_test.git
  sudo ansible-playbook -i localhost /Jenkins_test/user.yml
  sudo ansible-playbook -i localhost  /Jenkins_test/install.yml
  EOF
  
}


