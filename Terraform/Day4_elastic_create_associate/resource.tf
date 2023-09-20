resource "aws_instance" "ec1" {
  ami           = "ami-05552d2dcf89c9b24"
  instance_type = "t2.micro"
}

resource "aws_eip" "lb" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec1.id
  allocation_id = aws_eip.lb.id

}
