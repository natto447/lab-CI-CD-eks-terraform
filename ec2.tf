provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "projto-lab-2-2" {
    ami           = "ami-0fa3fe0fa7920f68e" # Amazon Linux 2 AMI
    instance_type = "t3.micro"

    subnet_id = module.vpc.public_subnets[0]   # EC2 na sub-rede pública
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  associate_public_ip_address = true

    tags = {
        Name = "projto-lab-2-2"
    }
}