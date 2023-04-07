variable "aws_region" {
  type    = string
  default = "us-east-1"
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