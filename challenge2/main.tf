provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "dbserver" {
  ami = "ami-0f7ae4d56aee106f1"
  instance_type = "t2.micro"
  tags = {
    "Name" = "dbserver"
  }
}

resource "aws_eip" "elasticip" {
  instance = aws_instance.webserver.id
}


resource "aws_instance" "webserver" {
  ami = "ami-0e34bbddc66def5ac"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
  user_data = file("server-script.sh")
  tags = {
    "Name" = "webserver"
  }

}


variable "ingressrules" {
  type = list(number)
  default = [ 80, 443 ]
}
variable "egressrules" {
  type = list(number)
  default = [ 80, 443 ]
}

resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "DB_IP" {
  value = aws_instance.dbserver.private_ip
}