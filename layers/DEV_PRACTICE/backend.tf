terraform {
backend "s3" {
 encrypt = true
 bucket = "terraform-state-dev-practice"
 dynamodb_table = "terraform-backend-lock-dev"
 region = "us-east-1"
 key = "terraform.tfstate"
 }
}