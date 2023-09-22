
resource "aws_iam_user" "user" {
  name = "sourabh"  # Replace with the desired username
}

resource "aws_iam_user_policy" "full_access" {
  name = "full-access-policy"
  user = aws_iam_user.user.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_access_key" "full_access_access_key" {
  user = aws_iam_user.user.name
}

output "access_key" {
  value = aws_iam_access_key.full_access_access_key.id
  sensitive =  true
}

output "secret_key" {
  value = aws_iam_access_key.full_access_access_key.secret
  sensitive =  true
}



## Make sure after running this to capture the secret and access key of the user ##
# terraform output -raw access_key
# terraform output -raw secret_key
