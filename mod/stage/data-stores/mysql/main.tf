provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_db_instance" "example" {
  identifier_prefix = "terraform-mysql"
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  skip_final_snapshot = true
  db_name = "example_database"
  username = var.db_username
  password = var.db_password
}

terraform {
  backend "s3" {
    bucket = "terraform-state-uvely"
    key = "stage/data-stores/mysql/terraform.tfstate"
    region = "ap-northeast-2"
    dynamodb_table = "terraform-locks"
    encrypt = true
  }
}
