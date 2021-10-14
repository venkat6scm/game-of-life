

variable "ami" {
  description = "image id to launch"
}

variable "key_name" {
description = "keyname"
}
variable "instance_type" {
  description = "instance type to launch"
  
} 

variable "availability_zones" {
  description = "Availability zones that are going to be used for the subnets"
  
}

variable "environment_tag" {
  description = "defining the environment"
  default= "DEV_PRACTICE"
}

