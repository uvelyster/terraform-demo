resource "aws_route_table_association" "subnet_2a" {
  subnet_id       = aws_subnet.public_2a.id
  route_table_id  = aws_route_table.internet_rt.id
}

resource "aws_route_table_association" "subnet_2c" {
  subnet_id       = aws_subnet.public_2c.id
  route_table_id  = aws_route_table.internet_rt.id
}
