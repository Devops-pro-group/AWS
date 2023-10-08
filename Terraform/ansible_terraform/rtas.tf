resource "aws_route_table_association" "rtasub1" {
    subnet_id = aws_subnet.subnet1.id
    route_table_id = aws_route_table.rtb.id
}

resource "aws_route_table_association" "rtasub2" {
    subnet_id = aws_subnet.subnet2.id
    route_table_id = aws_route_table.rtb.id
}
