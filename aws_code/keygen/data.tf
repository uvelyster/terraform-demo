data "aws_key_pair" "default" {
  key_name = "ansible"
}

output "fingerprint" {
  value = data.aws_key_pair.default.fingerprint
}

output "name" {
  value = data.aws_key_pair.default.key_name
}

output "id" {
  value = data.aws_key_pair.default.id
}

data "aws_vpc" "default" {
  default = true
}

data "aws_security_group" "default" {
  name    = "default"
  vpc_id  = data.aws_vpc.default.id
}
