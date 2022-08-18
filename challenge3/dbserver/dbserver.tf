variable "ec2dbname" {
  type = string
}
variable "traffic" {
  type = string
}

resource "aws_instance" "dbserver" {
  ami = "ami-0f7ae4d56aee106f1"
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2dbname
  }
  security_groups = [var.traffic]
}

output "private_ip" {
  value = aws_instance.dbserver.private_ip
}