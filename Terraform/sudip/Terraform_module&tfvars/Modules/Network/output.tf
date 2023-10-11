
output "vpc_id" {
  value = aws_vpc.sudip_custom_vpc.id
}
 
output "vpc_public_subnet1" {
  value = aws_subnet.sudip_custom_subnet_1.id

}

output "vpc_public_subnet2" {
  value = aws_subnet.sudip_custom_subnet_2.id

}

output "vpc_private_subnet1" {
  value = aws_subnet.sudip_custom_subnet_3.id

}

output "vpc_private_subnet2" {
  value = aws_subnet.sudip_custom_subnet_4.id
}

output "ec2_sg" {
  value = aws_security_group.sudip_custom_ec2_sg.id  
}

output "rds_sg" {
  value = aws_security_group.sudip_custom_private_sg.id  
}
