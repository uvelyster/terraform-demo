resource "aws_route_table" "internet_rt" {
  vpc_id = aws_vpc.terraformVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Internet Route Table"
  }
}
