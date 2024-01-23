resource "aws_subnet" "public_2a" {
  vpc_id            = aws_vpc.terraformVPC.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "Public Subnet ap-southeast-1a"
  }
}

resource "aws_subnet" "public_2c" {
  vpc_id            = aws_vpc.terraformVPC.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-southeast-1c"

  tags = {
    Name = "Public Subnet ap-southeast-1c"
  }
}
