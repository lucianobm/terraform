# w20_01_f

Deploy 1 EC2 Instances in your Default VPC.
Bootstrap the EC2 instance with a script that will install and start Jenkins.
Create and assign a Security Group to the Jenkins EC2 that allows traffic on port 22 from your ip and allows traffic from port 8080.
Create a S3 bucket for your Jenkins Artifacts that is not open to the public.
Verify that you can reach your Jenkins install via port 8080 in your browser.