resource "aws_instance" "web" {
  ami           = "ami-00ca32bbc84273381"
  instance_type = "t2.micro"
  #availability_zone = "us-east-1a"
  subnet_id = "subnet-0190fb046883fe411"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "HelloWorld"
  }
}

output ec2 {
  value = aws_instance.web.public_ip
}