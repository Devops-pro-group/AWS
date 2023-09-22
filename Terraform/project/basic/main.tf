# Create your first vpc 
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
}

# create first subnet  with /24 mean 254 ip address range 
resource "aws_subnet" "sub1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

}


# create second subnet  with /24 mean 254 ip address range 
resource "aws_subnet" "sub2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

}

# create internet gateway resource 
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

}

# Assign route table 
resource "aws_route_table" "route1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}

# Aassign  route table public for subnet1 association 
resource "aws_route_table_association" "route-assc1" {
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.route1.id
}


# Aassign  route table public for subnet3 association 
resource "aws_route_table_association" "route-assc2" {
  subnet_id      = aws_subnet.sub2.id
  route_table_id = aws_route_table.route1.id
}


resource "aws_security_group" "web_sg" {
  name        = "websg"
  description = "Allow web traffic in security group"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "SSL/TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
  }


  ingress {
    description = "http from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  ingress {
    description = "allow ssh traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

   ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}


#Create an s3 bucket 

resource "aws_s3_bucket" "bucket" {

  bucket = "mys3bucket897567556985"
  acl    = "private" #Set acl on s3 bucket 

  # Enable versioning for the bucket (optional)
  versioning {
    enabled = true
  }

}

# Create keypair  for instance 
# Create keypair for ec2 instance 
resource "aws_key_pair" "keypair" {
  key_name   = "keypair"                             # Change this to your desired key pair name
  public_key = file("/home/sourabh/.ssh/id_rsa.pub") #Replace with your keypair 
}




resource "aws_instance" "web_app1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = aws_subnet.sub1.id
  key_name = "keypair"
}


resource "aws_instance" "db1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = aws_subnet.sub2.id
  key_name = "keypair"
}

output "public_ip_web_app1" {
  value = aws_instance.web_app1.public_ip
}
 
output "public_ip_db1" {
  value = aws_instance.db1.public_ip
}
 
 
