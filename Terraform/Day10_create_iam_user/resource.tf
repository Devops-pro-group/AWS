# Define a list of IAM user names
variable "iam_user_names" {
  type    = list(string)
  default = ["development", "devops", "qa-tester"]
}

# Create IAM users with full permissions
resource "aws_iam_user" "full_access_users" {
  count = length(var.iam_user_names)
  name  = var.iam_user_names[count.index]
}

# Create access keys for the IAM users
resource "aws_iam_access_key" "full_access_keys" {
  count = length(var.iam_user_names)
  user  = aws_iam_user.full_access_users[count.index].name
}

# Output access keys and secret keys
output "access_keys" {
  value = [for key in aws_iam_access_key.full_access_keys : key.id]
  sensitive =  true
}

output "secret_keys" {
  value = [for key in aws_iam_access_key.full_access_keys : key.secret]
  sensitive =  true
}

# Output secret and access keys 
## terraform  output secret_keys
## terraform  output acess_keys
