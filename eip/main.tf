provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "ec2" {
  ami = "ami-0fb391cce7a602d1f"
  instance_type = "t2.micro"
}

resource "aws_eip" "elasticip" {
  instance = aws_instance.ec2.id
}

output "EIP" {
  value = aws_eip.elasticip.public_ip
}