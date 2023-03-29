terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "jenkins" {
  name        = "jenkins"
  description = "Allow 22 and 8080"
  # vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Jenkins"
  }
}

resource "aws_instance" "jenkins" {
  ami                    = "ami-04581fbf744a7d11f"
  instance_type          = "t2.micro"
  key_name               = "luciano"
  vpc_security_group_ids = [aws_security_group.jenkins.id]
  # associate_public_ip_address = true
  tags = {
    Name = "Jenkins"
  }

  user_data = <<-EOL
  #!/bin/bash -xe

  sudo yum update -y
  sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
  sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
  sudo yum upgrade
  sudo amazon-linux-extras install java-openjdk11 -y
  sudo yum install jenkins -y
  sudo systemctl daemon-reload
  sudo systemctl enable jenkins
  sudo systemctl start jenkins
  EOL

}

resource "aws_s3_bucket" "jenkins" {
  bucket = "jenkins-8534674"

  tags = {
    Name = "Jenkins"
  }
}

resource "aws_s3_bucket_acl" "jenkins" {
  bucket = aws_s3_bucket.jenkins.id
  acl    = "private"
}