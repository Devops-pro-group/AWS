# s3 bucket creation using map function 
resource "aws_s3_bucket" "storage" {
for_each = {
  "dev" = "dev-s3-bucket-00741"
  "qa" = "qa-s3-bucket-00741"
  "prod" = "prod-s3-bucket-00741"
}  
 bucket = "${each.key}-${each.value}"
  acl = "private"

  tags = {

    value = each.value
    env = each.key
    s3-bucket-name = "${each.key}-${each.value}"
  }
}

