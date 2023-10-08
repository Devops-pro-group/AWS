# Create keypair for ec2 instance 
resource "aws_key_pair" "keypair" {
  key_name   = "keypair"                             # Change this to your desired key pair name
  public_key = file("/home/sourabh/.ssh/id_rsa.pub") #Replace with your keypair 
}
