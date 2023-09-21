# Create an ec2 instance with custom keypair 
resource "aws_instance" "nginx" {
  ami           = "ami-05552d2dcf89c9b24" # Amazon linux
  instance_type = "t2.micro"              # Change to your desired instance type
  key_name      = "keypair"

  #Add custom security group in the instance 
  vpc_security_group_ids = [aws_security_group.example_sg.id]    #Make Sure security group has already been created first

}
