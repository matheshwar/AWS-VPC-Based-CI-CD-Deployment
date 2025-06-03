provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "./vpc"

  name               = "ci-cd-vpc"
  cidr               = "10.0.0.0/16"
  azs                = ["us-east-1a", "us-east-1b"]
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.11.0/24", "10.0.12.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true
  tags = {
    Name = "ci-cd-vpc"
  }
}

module "ui_instance" {
  source        = "./ec2"
  name          = "ui-server"
  subnet_id     = module.vpc.public_subnets[0]
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  iam_profile   = var.iam_instance_profile
}

module "api_instance" {
  source        = "./ec2"
  name          = "api-server"
  subnet_id     = module.vpc.private_subnets[0]
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  iam_profile   = var.iam_instance_profile
}
