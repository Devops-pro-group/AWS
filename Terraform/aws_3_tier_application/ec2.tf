resource "aws_instance" "web" {
  ami                         = "ami-0f5ee92e2d63afc18"
  key_name                    = "access"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public[count.index].id
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count                       = 2

  tags = {
    Name = "Webservers"
  }


}


resource "aws_instance" "db" {
  ami                         = "ami-0f5ee92e2d63afc18"
  key_name                    = "access"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.private.id
  vpc_security_group_ids      = [aws_security_group.allow_tls_db.id]
  associate_public_ip_address = true

  tags = {
    Name = "DB Servers"
  }
}
