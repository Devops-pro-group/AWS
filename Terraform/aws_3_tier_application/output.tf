output "db_instance" {
  value = aws_instance.db.public_ip
}
