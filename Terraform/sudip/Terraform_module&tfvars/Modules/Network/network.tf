
#------VPC------

resource "aws_vpc" "sudip_custom_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostname

  tags = var.vpc_environment_name
}


#------SUBNET 1------

resource "aws_subnet" "sudip_custom_subnet_1" {
  vpc_id                  = aws_vpc.sudip_custom_vpc.id
  cidr_block              = var.cidr_block_subnet_1
  availability_zone       = format("%sa", var.availability_zone)
  map_public_ip_on_launch = var.allow_public_ip_on_launch

  tags = var.environment_name_subnet_1
}


#------SUBNET 2------

resource "aws_subnet" "sudip_custom_subnet_2" {
  vpc_id                  = aws_vpc.sudip_custom_vpc.id
  cidr_block              = var.cidr_block_subnet_2
  availability_zone       = format("%sc", var.availability_zone)
  map_public_ip_on_launch = var.allow_public_ip_on_launch

  tags = var.environment_name_subnet_2
}


#------SUBNET 3------

resource "aws_subnet" "sudip_custom_subnet_3" {
  vpc_id            = aws_vpc.sudip_custom_vpc.id
  cidr_block        = var.cidr_block_subnet_3
  availability_zone = format("%sd", var.availability_zone)
  #map_public_ip_on_launch = var.allow_public_ip_on_launch

  tags = var.environment_name_subnet_3
}

#------SUBNET 4------

resource "aws_subnet" "sudip_custom_subnet_4" {
  vpc_id            = aws_vpc.sudip_custom_vpc.id
  cidr_block        = var.cidr_block_subnet_4
  availability_zone = format("%sc", var.availability_zone)
  #map_public_ip_on_launch = var.allow_public_ip_on_launch

  tags = var.environment_name_subnet_4
}

#------INTERNET GATEWAY------

resource "aws_internet_gateway" "sudip_custom_igw" {
  vpc_id = aws_vpc.sudip_custom_vpc.id

  tags = var.igw_environment_name
}


#------ROUTE TABLE PUBLIC------

resource "aws_route_table" "sudip_custom_public_rt" {
  vpc_id = aws_vpc.sudip_custom_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sudip_custom_igw.id
  }

  tags = var.routeTable_public_environment_name
}


#------ROUTE TABLE PRIVATE------

resource "aws_route_table" "sudip_custom_private_rt" {
  vpc_id = aws_vpc.sudip_custom_vpc.id

  tags = var.routeTable_private_environment_name
}


#------ROUTE TABLE ASSOCIATIONS------

resource "aws_route_table_association" "sudip_custom_routetable_assc_1" {
  subnet_id      = aws_subnet.sudip_custom_subnet_1.id
  route_table_id = aws_route_table.sudip_custom_public_rt.id
}

resource "aws_route_table_association" "sudip_custom_routetable_assc_2" {
  subnet_id      = aws_subnet.sudip_custom_subnet_2.id
  route_table_id = aws_route_table.sudip_custom_public_rt.id
}

resource "aws_route_table_association" "sudip_custom_routetable_assc_3" {
  subnet_id      = aws_subnet.sudip_custom_subnet_3.id
  route_table_id = aws_route_table.sudip_custom_private_rt.id
}

resource "aws_route_table_association" "sudip_custom_routetable_assc_4" {
  subnet_id      = aws_subnet.sudip_custom_subnet_4.id
  route_table_id = aws_route_table.sudip_custom_private_rt.id
}


#------SECURITY GROUP------

resource "aws_security_group" "sudip_custom_ec2_sg" {
  name   = format("%s-ec2-sg", var.nameWithDate)
  vpc_id = aws_vpc.sudip_custom_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.from_port_2
    to_port     = var.to_port_2
    protocol    = var.protocol
    cidr_blocks = [var.cidr_myip]
  }

  ingress {
    from_port   = "9000"
    to_port     = "9000"
    protocol    = var.protocol
    cidr_blocks = [var.cidr_all]
  }

  ingress {
    from_port   = var.from_port_1
    to_port     = var.to_port_1
    protocol    = var.protocol
    cidr_blocks = [var.cidr_all]
  }

  tags = var.sg_public_environment_name
}


#------SECURITY GROUP PRIVATE------

resource "aws_security_group" "sudip_custom_private_sg" {
  name   = format("%s-rds-sg", var.nameWithDate)
  vpc_id = aws_vpc.sudip_custom_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = var.from_port_rds
    to_port         = var.to_port_rds
    protocol        = var.protocol
    security_groups = [aws_security_group.sudip_custom_ec2_sg.id]
  }

  tags = var.sg_private_environment_name
}


