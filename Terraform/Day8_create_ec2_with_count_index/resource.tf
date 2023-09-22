
# Create a security group for SSH and HTTP
resource "aws_security_group" "user_sg" {
  name        = "user-sg"
  description = "Security group for SSH and HTTP traffic"

  # Define ingress rules to allow SSH (port 22) and HTTP (port 80) traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # You can restrict the IP range if needed
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # You can restrict the IP range if needed
  }


  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # You can restrict the IP range if needed
  }


  # Define an ingress rule that allows all traffic
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows traffic from any source (be cautious)
  }
  # Define an ingress rule that allows all ICMP traffic
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"] # Allows ICMP traffic from any source (be cautious)
  }

  # Define an ingress rule that allows all UDP traffic
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"] # Allows UDP traffic from any source (be cautious)
  }

  # Define an ingress rule to allow ICMP traffic from the internet (0.0.0.0/0)
  ingress {
    from_port   = -1 # ICMP doesn't use port numbers, so set to -1
    to_port     = -1 # ICMP doesn't use port numbers, so set to -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create 3 ec2 instance with count index variable 

resource "aws_instance" "ec2" {
  count = 3 

  ami = var.ami-id
  instance_type = var.instance_type
  key_name = "keypair"
  vpc_security_group_ids = [aws_security_group.user_sg.id]   # Make sure you create security group first 
  tags = {
      Name = "ec2- ${count.index}"
  }
}

output "private_ip" {
  value = aws_instance.ec2[*].private_ip
}

output "public_ip" {
  value = aws_instance.ec2[*].public_ip
}
