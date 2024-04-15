variable  "aws_region" {

    default = "us-east-1"  #region where VPC wll eb launched
}

variable "cidr_vpc" {
    default = "10.0.0.0/16"    
}

variable "cidr_subnet_private_1" {
    default = "10.0.1.0/24"  
}

variable "cidr_subnet_private_2" {
    default = "10.0.2.0/24"  
}

variable "cidr_subnet_public_1" {
    default = "10.0.3.0/24"  
}

variable "cidr_subnet_public_2" {
    default = "10.0.4.0/24"  
}

variable "cidr_block_route_table" {
  default = "0.0.0.0/0"
}

variable "availability_zones" {

    type = list
    default = ["us-east-1a" , "us-east-1b"]   #defining AZs for Subnets
}

variable "asg_ami" {
  default = "ami-051f8a213df8bc089"
}

variable "asg_prefix" {
  default = "terraformTraining"
}

variable "asg_instance_type" {
  default = "t2.micro"
}

variable "asg_name_tag" {
  default = "trainingTerraform_asg_instance"
}

variable "ec2_ami" {
  default = "ami-051f8a213df8bc089"
}

variable "ec2_instance_type" {
  default = "t2.micro"
}

variable "ec2_name_tag" {
  default = "trainingTerraform_bastion_host"
}

variable "key_pair" {
  default = "MobaXTerm"
}

variable "ec2_private_name_tag" {
  default = "trainingTerraform_ec2_private_subnet"
}

variable "ec2_default_user" {
  default = "ec2-user"
}

variable "ec2_private2_name_tag" {
  default = "trainingTerraform_ec2_private_subnet2"
}