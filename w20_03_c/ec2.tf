resource "aws_instance" "jenkins" {
  ami                    = var.jenkins_ami
  instance_type          = var.jenkins_instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.jenkins.id]
  # associate_public_ip_address = true
  user_data            = file("install-jenkins.sh")
  iam_instance_profile = aws_iam_instance_profile.jenkins-s3-profile.name
  tags = {
    Name = var.jenkins_instance_name
  }
}