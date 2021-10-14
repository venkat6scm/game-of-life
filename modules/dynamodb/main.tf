
resource "aws_dynamodb_table" "practice-dynamodb-table" {
  name           = "dynamodb"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "dynamohash"

  attribute {
    name = "dynamohash"
    type = "S"
  }


}