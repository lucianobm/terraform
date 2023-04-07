resource "aws_launch_template" "apache" {
  name                   = "apache"
  image_id               = var.apache_ami
  instance_type          = var.apache_instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.apache.id]
  user_data              = filebase64("install-apache.sh")
  tags = {
    Name = var.apache_instance_name
  }
}