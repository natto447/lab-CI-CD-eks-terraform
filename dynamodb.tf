module "aws_dynamodb_table" {
  source = "terraform-aws-modules/dynamodb-table/aws"

  name         = "projeto-lab-2-2-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attributes = [
    {
      name = "id"
      type = "S"
    }
  ]

  tags = {
    Environment = "lab-2-2"
    Project     = "projeto-lab-2-2"
  }
  
}