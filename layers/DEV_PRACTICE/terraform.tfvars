#GLOBAL PARAMETERS
region             = "us-east-1"
availability_zones = "us-east-1b"


#EC2 PARAMETERS
ami                = "ami-07d0cf3af28718ef8"
key_name           = "terraform"
instance_type      = "t2.micro"
#DATABASE PARAMETERS
engine               = "mysql"
engine_version       = "5.7"
instance_class       = "db.t2.micro"
name                 = "practicedb"
username             = "root"
password             = "password"
parameter_group_name = "default.mysql5.7"
#AUTOSCALING GROUP PARAMETERS
name_prefix      =  "terraform_asg_launch"
image_id         =  "ami-07d0cf3af28718ef8"
#APPLICATION LOAD BALANCER PARAMETERS
subnets=["subnet-0a25656d", "subnet-36561918"]
certificate_arn   = "arn:aws:acm:us-east-1:407449588770:certificate/a69fe210-e8a9-45be-b2be-47e3cd1bf13c"
ssl_policy        = "ELBSecurityPolicy-2016-08"
