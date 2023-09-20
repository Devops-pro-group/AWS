

# Create a security group 


# Create a security group
resource "aws_security_group" "example_sg" {
  name        = "sec-terraform"
  description = "security group created by terraform"

  # Define inbound rules (allow SSH and HTTP traffic)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}





resource "aws_instance" "web" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"

  tags = {
    Name = "first-instance"

   
  }

  # Associate the security group with the instance
  vpc_security_group_ids = [aws_security_group.example_sg.id]
  
}
