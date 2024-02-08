output "public_dns" {
    value = aws_instance.server.private_dns
      
}

output "private_ip" {
    value = aws_instance.server.private_ip
  
}
output "public_ip" {
    value = aws_instance.server.public_ip
  
}
output "jenkins_url" {
    value = "http://${aws_instance.server.public_ip}:8080"
  
}
output "id" {
    value = aws_instance.server.id
  
}