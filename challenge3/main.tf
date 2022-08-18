provider "aws" {
  region = "eu-west-2"
}

module "trafficmodule" {
  source = "./security_groups"
  modulename = "Allow HTTP & HTTPS"
}

module "webserver" {
  source = "./webserver"
  ec2webname = "Webserver"
  traffic = module.trafficmodule.modulename
}
module "dbserver" {
  source = "./dbserver"
  ec2dbname = "Dbserver"
  traffic = module.trafficmodule.modulename
}

resource "aws_eip" "elasticip" {
  instance = module.webserver.id
}

output "EIP" {
  value = aws_eip.elasticip.public_ip
}

output "DB_IP" {
  value = module.dbserver.private_ip
}