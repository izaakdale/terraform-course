provider "aws" {
    region = "eu-west-2"
}

variable "inputname" {
  type = string
  description = "Set the name of the VPC"
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}

variable "mytuple" {
  type = tuple([string, number, string])
  default = ["cat", 1, "dog"]
}

variable "myobject" {
  type = object({name = string, port = list(number)})
  default = {
    name = "Izaak"
    port = [22,443,80]
  }
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = var.inputname
    }
}