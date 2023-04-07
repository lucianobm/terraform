resource "aws_security_group" "apache-alb-sg" {
  name        = "apache-alb-sg"
  description = "Allow 22 and 80"
  # vpc_id      = aws_vpc.main.id

  ingress {
    description = "80"
    from_port   = 80
    to_port     = 80
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
    Name = var.apache_instance_name
  }
}