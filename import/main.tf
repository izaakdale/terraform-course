provider "aws" {
    region = "eu-west-2"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
}

// created a vpc through the ui, then ran this:
// terraform import aws_vpc.myvpc2 vpc-0cfd942a7f60c79ef
resource "aws_vpc" "myvpc2" {
    cidr_block = "192.168.0.0/24"
}