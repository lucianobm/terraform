resource "aws_autoscaling_group" "apache" {
  name               = "apache"
  availability_zones = ["us-east-1a", "us-east-1b"]
  desired_capacity   = 2
  max_size           = 5
  min_size           = 2

  launch_template {
    id      = aws_launch_template.apache.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = var.apache_instance_name
    propagate_at_launch = true
  }
}