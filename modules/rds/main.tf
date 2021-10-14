resource "aws_db_instance" "dbserver" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "${var.engine}"
  engine_version       = "${var.engine_version}"
  instance_class       = "${var.instance_class}"
  name                 = "${var.name}"
  username             = "${var.username}"
  password             = "${var.password}"
  parameter_group_name = "${var.parameter_group_name}"
  final_snapshot_identifier = "DemoPracticeDB"
  skip_final_snapshot = "true"
}