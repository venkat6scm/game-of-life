

module "asg_and_alb" {
  source = "../../modules/asg_and_alb"
  name_prefix            = "${var.name_prefix}"
  image_id               = "${var.image_id}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_name}"
  availability_zones     = "${var.availability_zones}"
  subnets                = "${var.subnets}"
  certificate_arn        = "${var.certificate_arn}"
  ssl_policy             = "${var.ssl_policy}"
}


module "rds" {
  source = "../../modules/rds"
  engine               = "${var.engine}"
  engine_version       = "${var.engine_version}"
  instance_class       = "${var.instance_class}"
  name                 = "${var.name}"
  username             = "${var.username}"
  password             = "${var.password}"
  parameter_group_name = "${var.parameter_group_name}"
  
 
}

module "dynamodb" {
  source = "../../modules/dynamodb"
  
}


module "s3withkms" {
  source = "../../modules/s3withkms"
  
}

  
