resource "aws_lb_target_group" "apache" {
  name     = "apache-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-0705e9255f59bea01"

  # health_check {
  #   path    = "/"
  #   timeout = 5
  #   matcher = "200"
  # }
}

resource "aws_lb" "apache" {
  name               = "apache-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.apache-alb-sg.id]
  subnets            = ["subnet-0b37622c1ecf9bc6b", "subnet-098d677c28797fc8b"]

  # enable_deletion_protection = true

  #  access_logs {
  #    bucket  = aws_s3_bucket.lb_logs.id
  #    prefix  = "test-lb"
  #    enabled = true
  #  }

  tags = {
    Environment = "apache"
  }
}

resource "aws_lb_listener" "apache" {
  load_balancer_arn = aws_lb.apache.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.apache.arn
  }
}