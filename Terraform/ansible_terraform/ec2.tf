resource "aws_instance" "jenkins" {
    ami = "ami-0f5ee92e2d63afc18"
    key_name = aws_key_pair.keypair.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    subnet_id = aws_subnet.subnet1.id
  
}

resource "aws_instance" "netflix" {
    ami = "ami-0f5ee92e2d63afc18"
    key_name = aws_key_pair.keypair.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    subnet_id = aws_subnet.subnet1.id
  
}


resource "aws_instance" "zomato" {
    ami = "ami-0f5ee92e2d63afc18"
    key_name = aws_key_pair.keypair.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    subnet_id = aws_subnet.subnet2.id
  
}
