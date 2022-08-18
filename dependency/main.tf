provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "db" {
  ami = "ami-0fb391cce7a602d1f"
  instance_type = "t2.micro"
  tags = {
    "Name" = "Db"
  }
}

resource "aws_instance" "web" {
  ami = "ami-0fb391cce7a602d1f"
  instance_type = "t2.micro"
  tags = {
    "Name" = "Web"
  }
  depends_on = [
    aws_instance.db
  ]
}

data "aws_instance" "dbsearch" {
  filter {
    name = "tag:Name"
    values = [ "Db" ]
  }
}

output "dbservers" {
  value = data.aws_instance.dbsearch.availability_zone
}
