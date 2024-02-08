# create the ec2 instance
resource "aws_instance" "server" {
  ami           = "ami-0cf10cdf9fcd62d37"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ec2_key2.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = module.vpc.public_subnets[0]
  user_data = file("jenkins.sh")
  associate_public_ip_address = true

  tags = {
    Name = "Jenkins-instance"
    Env  = "dev"
  }
}
