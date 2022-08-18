variable "ec2webname" {
  type = string
}
variable "traffic" {
  type = string
}

resource "aws_instance" "webserver" {
  ami = "ami-0e34bbddc66def5ac"
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2webname
  }
  security_groups = [var.traffic]
  user_data = file("server-script.sh")
}

output "public_ip" {
  value = aws_instance.webserver.public_ip
}
output "id" {
  value = aws_instance.webserver.id
}