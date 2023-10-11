nameWithDate      = "sudip-test-dev"
availability_zone = "ap-northeast-1"
instance_type     = "t2.micro"

vpc_environment_name = {
  "stage" = "prod-vpc",
  "Name"  = "sudip-test-prod-vpc"
}

vpc_cidr_block      = "14.14.0.0/22"
enable_dns_hostname = true

cidr_block_subnet_1 = "14.14.0.0/24"
environment_name_subnet_1 = {
  "Name"  = "1a-sudip-test-prod-subnet-public"
  "Stage" = "prod"
}

cidr_block_subnet_2 = "14.14.1.0/24"
environment_name_subnet_2 = {
  "Name"  = "1c-sudip-test-prod-subnet-public"
  "Stage" = "prod"
}

cidr_block_subnet_3 = "14.14.2.0/24"
environment_name_subnet_3 = {
  "Name"  = "1d-sudip-test-prod-subnet"
  "Stage" = "prod"
}

cidr_block_subnet_4 = "14.14.3.0/24"
environment_name_subnet_4 = {
  "Name"  = "1c-sudip-test-prod-subnet"
  "Stage" = "prod"
}

allow_public_ip_on_launch = true

igw_environment_name = {
  "Name"  = "sudip-test-prod-igw"
  "Stage" = "prod"
}

routeTable_public_environment_name = {
  "Name"  = "sudip-test-prod-routetable-public"
  "Stage" = "prod"
}

routeTable_private_environment_name = {
  "Name"  = "sudip-test-prod-routeTable-private"
  "Stage" = "prod"
}

from_port_1   = 8085
to_port_1     = 8085
from_port_2   = 22
to_port_2     = 22
from_port_rds = 3306
to_port_rds   = 3306
protocol      = "tcp"
cidr_all      = "0.0.0.0/0"
cidr_myip     = "65.2.88.212/32"
sg_id_ec2_sg  = "sg-0ad81f80bb5c44973"
sg_public_environment_name = {
  "Name"  = "sudip-test-prod-ec2-sg"
  "Stage" = "prod"
}
sg_private_environment_name = {
  "Name"  = "sudip-test-prod-rds-sg"
  "Stage" = "prod"
}


ami      = "ami-0d52744d6551d851e"
key_name = "mykey"
ec2_environment_name = {
  "Name"  = "prod-test"
  "Stage" = "prod"
}



db_subgroup_environment_name = {
  "Name"  = "sudip-test-prod-dbsubnet"
  "Stage" = "prod"
}

db_instance_class = "db.t2.micro"
db_pass           = "sudipprod123"
db_username       = "admin"
db_engine         = "mysql"
mysql_version     = "8.0.33"
DBname            = "sudipdb"

