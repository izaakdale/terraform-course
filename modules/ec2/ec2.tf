variable "ec2name" {
  type = string
}
resource "aws_instance" "myec2" {
  ami = "ami-0fb391cce7a602d1f"
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2name
  }
}

output "instance_id" {
  value = aws_instance.myec2.id
}