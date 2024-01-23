resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terraformVPC.id

  tags = {
    Name = "terraformVPC-IGW"
  }
}
