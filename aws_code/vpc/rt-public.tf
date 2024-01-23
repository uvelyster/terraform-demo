resource "aws_route_table_association" "public_subnet_asso" {
  count         = length(var.public_subnet)
  subnet_id     = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.internet_rt.id
}
