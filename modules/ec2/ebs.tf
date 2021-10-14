
data "aws_kms_key" "Kmskey" {
  key_id = "alias/DEV_KMS_KEY_PRACTICE"
}

resource "aws_ebs_volume" "example" {
  availability_zone = "${var.availability_zones}"
  size              = 8
  encrypted         = true
  kms_key_id        = "${data.aws_kms_key.Kmskey.arn}"
}

resource "aws_volume_attachment" "ebs_att" {
 device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.example.id}"
  instance_id = "${aws_instance.terraformmachine.id}"
  depends_on  = ["aws_ebs_volume.example","aws_instance.terraformmachine"]
}


	