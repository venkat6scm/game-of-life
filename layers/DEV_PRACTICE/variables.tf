# global parameters like accesskey, secretkey, region and availability zone ...etc
variable "region" {
  description = "Region"
}
variable "availability_zones" {
  description = "Availability zones that are going to be used for the subnets"
}


#EC2-INSTANCE PARAMETERS
variable "ami" {
  description = "image id to launch"
}

variable "key_name" {
description = "keyname"
}
variable "instance_type" {
  description = "instance type to launch" 
} 
# DATABASE PARAMETERS
variable "engine" {
  description = "This is the database engine what we are trying to create"
}
variable "engine_version" {
  description ="database version to install"
}
variable "instance_class" {
  description= "database instance type to launch"
}
variable "name" {
  description ="This is the database name  to store data"
}

variable "username" {
  description ="database username"
}
variable "password" {
  description="database password"
}
variable "parameter_group_name" {
  description="parameter_group_name"
}

#AUTO SCALING GROUP PARAMETERS

variable "name_prefix" {
description ="name of launch configuration"
}

variable "image_id" {
  description ="ami to attach autoscaling group"
}

# APPLICATION LOAD BALANCER PARAMETERS
variable "subnets" {
  description= "list of subnets"
}
variable "certificate_arn" {
  default="https self signed certificate arn"
}

variable "ssl_policy" {
  description="ssl policy"
}






