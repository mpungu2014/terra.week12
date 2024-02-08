# Generate a secure key using a rsa algorithm
resource "tls_private_key" "ec2_key2" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# creating the keypair in aws
resource "aws_key_pair" "ec2_key2" {
  key_name   = "jenkins-key2"                 
  public_key = tls_private_key.ec2_key2.public_key_openssh 
}

# Save the .pem file locally for remote connection
resource "local_file" "ssh_key" {
  filename = "jenkins.pem"
  content  = tls_private_key.ec2_key2.private_key_pem
}
