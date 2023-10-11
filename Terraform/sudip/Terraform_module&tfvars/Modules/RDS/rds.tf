resource "aws_db_subnet_group" "sudip_custom_db_subnetgrp" {
  name = "${format("%s-dbsubnet", var.nameWithDate)}"
  description = "Terraform example RDS subnet group"
  subnet_ids  = [var.subnet_id_1,var.subnet_id_2]

  tags = var.db_subgroup_environment_name
}


#------RDS DB INSTANCE------

resource "aws_db_instance" "default" {
  identifier                = "${format("%s-test-db", var.nameWithDate)}"
  allocated_storage         = 5
  engine                    = var.db_engine
  engine_version            = var.mysql_version
  instance_class            = var.db_instance_class
  name                      = var.DBname
  username                  = var.db_username
  password                  = var.db_pass
  db_subnet_group_name      = aws_db_subnet_group.sudip_custom_db_subnetgrp.id
  vpc_security_group_ids    = [var.rds_sg_id]
  skip_final_snapshot       = true
  final_snapshot_identifier = "Ignore"
}
