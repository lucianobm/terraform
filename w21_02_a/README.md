### w21_02_a

##### ADVANCED

- Add an ALB in front of the Auto Scaling group.
- Create a security group for the ALB that allows traffic from the internet and associate it with the ALB.
- Modify the Auto Scaling group security group to allow only traffic from the ALB.
- Output the public dns name of the ALB and verify you are able to reach your webservers from your browser.