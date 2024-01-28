variable "server_port" {
  description = "The port of web server"
  type = number
  default = 8080
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    bucket = "terraform-state-uvely"
    key = "stage/data-stores/mysql/terraform.tfstate"
    region = "ap-northeast-2"
  }
}

