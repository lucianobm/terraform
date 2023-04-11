resource "aws_lb_target_group" "apache" {
  name     = "apache-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

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
  subnets            = [for subnet in aws_subnet.public_subnets : subnet.id]

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