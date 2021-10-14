
data "aws_kms_key" "Kmskey" {
  key_id = "alias/DEV_KMS_KEY_PRACTICE"
}

resource "aws_s3_bucket_object" "s3exampleobject" {
  key        = "testfile.html"
  bucket     = "terraform-state-dev-practice"
  source     = "./mani.html"
  kms_key_id = "${data.aws_kms_key.Kmskey.arn}"
  
}