variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "ami" {
  description = "AMI ID for EC2 instance"
  default     = "ami-0c02fb55956c7d316"  
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "EC2 Key pair name"
  default     = "proj"
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile for EC2"
  default     = "ec2_ssm_role"
}
