output "jenkins_ipv4" {
    value = aws_instance.jenkins.public_ip
}

output "netflix_ipv4" {
    value = aws_instance.netflix.public_ip
}

output "zomato_ipv4" {
    value = aws_instance.zomato.public_ip
}
