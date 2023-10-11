variable "ami" {
  description = "ami"
  type = string

}
variable "instance_type" {
  description = "type"
  type = string
#  default = "t2.micro"
}
variable "key_name" {
  description = "key"
  type = string
#  default = "mykey"
}

variable "subnet_id" {
  description = "subnetid"
  type = string
}

variable "security_group_id" {
  description = "key"
  type = string
}

variable "ec2_environment_name" {
  description = "env"
  type = map(string)
}
