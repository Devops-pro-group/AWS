# Create one elastic load balancer ip  

resource "aws_eip" "lb" {
  vpc = true

}

# Creaet an s3 bucket 

resource "aws_s3_bucket" "bucket2" {
  bucket = "my-tf-bucket2"

}


output "eip_output" {

  value = aws_eip.lb.public_ip
}

output "s3_arn" {
  value = aws_s3_bucket.bucket2.arn
}
