variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "jenkins_ami" {
  description = "Amazon Linux"
  default     = "ami-04581fbf744a7d11f"
}

variable "jenkins_instance_type" {
  description = ""
  default     = "t2.micro"
}

variable "key_name" {
  description = ""
  default     = "luciano"
}

variable "jenkins_instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "Jenkins"
}

variable "jenkins_bucket" {
    type = string
    default = "jenkins-8534674"
}