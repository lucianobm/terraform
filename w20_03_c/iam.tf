resource "aws_iam_role" "jenkins-s3-role" {
  name = "jenkins-s3-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    tag-key = var.jenkins_instance_name
  }
}

resource "aws_iam_instance_profile" "jenkins-s3-profile" {
  name = "jenkins-s3-profile"
  role = aws_iam_role.jenkins-s3-role.name
}

resource "aws_iam_role_policy" "jenkins-s3-policy" {
  name = "jenkins-s3-policy"
  role = aws_iam_role.jenkins-s3-role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::${var.jenkins_bucket}",
        "arn:aws:s3:::${var.jenkins_bucket}/*"
      ]
    }
  ]
}
EOF
}