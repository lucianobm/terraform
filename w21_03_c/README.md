### w21_03_c

##### COMPLEX

- Create a custom vpc rather than using the default vpc.
- The custom vpc should have 2 public subnets, 2 private subnets, a public route table and private route table, a NAT Gateway in the public subnet, and an Internet Gateway so there is outbound internet traffic.
- Launch your ALB in the public subnets.
- Launch your Auto Scaling group in your private subnets.
- Output your public DNS of your ALB and then verify you can reach your Webserver via the url.