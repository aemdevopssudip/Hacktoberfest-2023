terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"

  # backend "s3" {

  #   bucket = "sudip-test-tf-bucket"
  #   key    = "key/terraform.tfstate"
  #   region = "ap-northeast-1"
  #   dynamodb_table = "sudip-test-dynamo"
  # }

}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}


#------VPC & subnets------

module "network" {
  source               = "./Modules/network/"
  vpc_cidr_block       = var.vpc_cidr_block
  enable_dns_hostname  = var.enable_dns_hostname
  vpc_environment_name = var.vpc_environment_name

  availability_zone         = var.availability_zone
  allow_public_ip_on_launch = var.allow_public_ip_on_launch

  cidr_block_subnet_1       = var.cidr_block_subnet_1
  environment_name_subnet_1 = var.environment_name_subnet_1

  cidr_block_subnet_2       = var.cidr_block_subnet_2
  environment_name_subnet_2 = var.environment_name_subnet_2

  cidr_block_subnet_3       = var.cidr_block_subnet_3
  environment_name_subnet_3 = var.environment_name_subnet_3

  cidr_block_subnet_4       = var.cidr_block_subnet_4
  environment_name_subnet_4 = var.environment_name_subnet_4

  igw_environment_name = var.igw_environment_name

  routeTable_public_environment_name  = var.routeTable_public_environment_name
  routeTable_private_environment_name = var.routeTable_private_environment_name

  nameWithDate = var.nameWithDate
  from_port_1  = var.from_port_1
  to_port_1    = var.to_port_1
  from_port_2  = var.from_port_2
  to_port_2    = var.to_port_2

  protocol                   = var.protocol
  cidr_myip                  = var.cidr_myip
  cidr_all                   = var.cidr_all
  sg_id_ec2_sg               = var.sg_id_ec2_sg
  sg_public_environment_name = var.sg_public_environment_name

  from_port_rds               = var.from_port_rds
  to_port_rds                 = var.to_port_rds
  sg_private_environment_name = var.sg_private_environment_name
}

#------EC2 INSTANCE------

module "webserver" {
  source        = "./Modules/module_EC2/"
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id                       = module.network.vpc_public_subnet1
  security_group_id               = module.network.ec2_sg
  ec2_environment_name            = var.ec2_environment_name
}


module "RDS" {
  source                       = "./Modules/RDS/"
  db_engine                    = var.db_engine
  mysql_version                = var.mysql_version
  db_instance_class            = var.db_instance_class
  DBname                       = var.DBname
  db_username                  = var.db_username
  db_pass                      = var.db_pass
  nameWithDate                 = var.nameWithDate
  db_subgroup_environment_name = var.db_subgroup_environment_name
  rds_sg_id                    = module.network.rds_sg
  subnet_id_1                  = module.network.vpc_private_subnet1
  subnet_id_2                  = module.network.vpc_private_subnet2

}

