variable "server_names" {
  type = list(string)
}

resource "aws_instance" "dbserver" {
  ami = "ami-0f7ae4d56aee106f1"
  instance_type = "t2.micro"
  count = length(var.server_names)
  tags = {
    Name = var.server_names[count.index]
  }
}

output "private_ip" {
  value = aws_instance.dbserver.*.private_ip
}