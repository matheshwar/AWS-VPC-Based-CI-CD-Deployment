resource "aws_instance" "ui" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnets[0]
  key_name      = "proj"

  tags = {
    Name = "ui-server"
  }

  iam_instance_profile = aws_iam_instance_profile.ec2_ssm.name
}

resource "aws_instance" "api" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.private_subnets[0]
  key_name      = "proj"

  tags = {
    Name = "api-server"
  }

  iam_instance_profile = aws_iam_instance_profile.ec2_ssm.name
}
