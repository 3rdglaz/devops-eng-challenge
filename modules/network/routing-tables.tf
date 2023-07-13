resource "aws_route_table" "routing-table" {
  vpc_id = aws_vpc.mainvpc.id
  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
}
resource "aws_route_table_association" "public_association-a" {
  subnet_id      = aws_subnet.public-subnet-a.id
  route_table_id = aws_route_table.routing-table.id
}
resource "aws_route_table_association" "private_association-a" {
  subnet_id      = aws_subnet.private-subnet-a.id
  route_table_id = aws_route_table.routing-table.id
}
resource "aws_route_table_association" "public_association-b" {
  subnet_id      = aws_subnet.public-subnet-b.id
  route_table_id = aws_route_table.routing-table.id
}
resource "aws_route_table_association" "private_association-b" {
  subnet_id      = aws_subnet.private-subnet-b.id
  route_table_id = aws_route_table.routing-table.id
}