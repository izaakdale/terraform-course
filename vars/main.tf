provider "aws" {
  region = "eu-west-2"
}

variable "number_of_servers" {
  type = number
}

resource "aws_instance" "myec2" {
  ami = "ami-0fb391cce7a602d1f"
  instance_type = "t2.micro"
  count = var.number_of_servers
  tags = {
    "Name" = "Tester"
  }
}