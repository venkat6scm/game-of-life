

resource "aws_launch_configuration" "launch_conf" {
  name_prefix   = "${var.name_prefix}"
  image_id      = "${var.image_id}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"
  security_groups = ["${aws_security_group.ALLPORTS_ASG_DEV.name}"]

   user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install apache2 -y
              sudo add-apt-repository ppa:ondrej/php -y
              sudo apt-get update
              sudo apt-get install php5.6 -y
              sudo chmod 777 /var/www/html
              EOF
}

resource "aws_autoscaling_policy" "aws_asg_policy" {
  name                   = "scalingpolicy"
  scaling_adjustment     = 4
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.asg.name}"
  depends_on             =["aws_autoscaling_group.asg"]
}
resource "aws_autoscaling_group" "asg" {
  name                 = "autoscalinggroup"
  launch_configuration = "${aws_launch_configuration.launch_conf.name}"
  min_size             = 2
  max_size             = 3
  availability_zones   =["${var.availability_zones}"]
  target_group_arns       = ["${aws_alb_target_group.albtarget.arn}","${aws_alb_target_group.albtarget1.arn}"]
  depends_on           =["aws_launch_configuration.launch_conf","aws_alb.test"]
  tags = [{
       key                 = "Env"
       value               = "${var.environment_tag}"
       propagate_at_launch = true
    }]

}

resource "aws_autoscaling_attachment" "alb_autoscale" {
  alb_target_group_arn  = "${aws_alb_target_group.albtarget.arn}"
  autoscaling_group_name = "${aws_autoscaling_group.asg.id}"
}
