variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.20.0.0/16"
}

variable "vpc_name" {
  type    = string
  default = "my_new_vpc"
}

variable "private_subnets" {
  default = {
    "private_subnet_1" = 1
    "private_subnet_2" = 2
  }
}

variable "public_subnets" {
  default = {
    "public_subnet_1" = 1
    "public_subnet_2" = 2
  }
}

variable "apache_ami" {
  description = "Amazon Linux"
  default     = "ami-04581fbf744a7d11f"
}

variable "apache_instance_type" {
  description = ""
  default     = "t2.micro"
}

variable "key_name" {
  description = ""
  default     = "luciano"
}

variable "apache_instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "Apache"
}