resource "aws_instance" "test_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true


  tags = var.ec2_environment_name
}
