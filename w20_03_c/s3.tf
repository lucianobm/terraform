resource "aws_s3_bucket" "jenkins" {
  bucket = var.jenkins_bucket

  tags = {
    Name = var.jenkins_instance_name
  }
}

resource "aws_s3_bucket_acl" "jenkins" {
  bucket = aws_s3_bucket.jenkins.id
  acl    = "private"
}