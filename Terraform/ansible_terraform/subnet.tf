resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.sub1
    availability_zone = var.availability_zone1
    map_public_ip_on_launch =  true
}


resource "aws_subnet" "subnet2" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.sub2
    availability_zone = var.availability_zone2
    map_public_ip_on_launch =  true
}

