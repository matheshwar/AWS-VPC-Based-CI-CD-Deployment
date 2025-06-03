resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  iam_instance_profile = var.iam_profile

  tags = {
    Name = var.name
  }
}
