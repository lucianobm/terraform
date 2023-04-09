### w21_01_f

- Launch an Auto Scaling group that spans 2 subnets in your default vpc.
- Create a security group that allows traffic from the internet and associate it with the Auto Scaling group instances.
- Include a script in your user data to launch an apache webserver. The Auto Scaling group should have a min of 2 and max of 5.
- To verify everything is working check the public ip addresses of the two instances. Manually terminate one of the instances to verify that another one spins up to meet the minimum requirement of 2 instances.
- Create an S3 bucket and set it as your remote backend.