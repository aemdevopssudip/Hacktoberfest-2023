variable "nameWithDate" {}
variable "vpc_cidr_block" {}
variable "enable_dns_hostname" {}
variable "vpc_environment_name" {}
variable "availability_zone" {}

variable "cidr_block_subnet_1" {}
variable "environment_name_subnet_1" {}

variable "cidr_block_subnet_2" {}
variable "environment_name_subnet_2" {}

variable "cidr_block_subnet_3" {}
variable "environment_name_subnet_3" {}

variable "cidr_block_subnet_4" {}
variable "environment_name_subnet_4" {}

variable "allow_public_ip_on_launch" {}

variable "igw_environment_name" {}

variable "routeTable_public_environment_name" {}
variable "routeTable_private_environment_name" {}

variable "from_port_1" {}
variable "to_port_1" {}
variable "from_port_2" {}
variable "to_port_2" {}
variable "from_port_rds" {}
variable "to_port_rds" {}
variable "protocol" {}
variable "cidr_myip" {}
variable "cidr_all" {}
variable "sg_id_ec2_sg" {}
variable "sg_public_environment_name" {}
variable "sg_private_environment_name" {}

variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
variable "ec2_environment_name" {}

variable "db_subgroup_environment_name" {}

variable "db_instance_class" {}
variable "db_pass" {}
variable "db_username" {}
variable "db_engine" {}
variable "mysql_version" {}
variable "DBname" {}


