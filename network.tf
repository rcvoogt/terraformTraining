//VPC
resource "aws_vpc" "vpc" {
  cidr_block       = var.cidr_vpc
  instance_tenancy = "default"

  tags = {
    Name = "terraformTraining_vpc"
  }
}

////////////////////////////////////////////////////////////////////////
//Subnets
resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.cidr_subnet_private_1
  availability_zone = element(var.availability_zones,1)

  tags = {
    Name = "terraformTraining_private_subnet_1"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.cidr_subnet_public_1
  availability_zone = element(var.availability_zones,1)

  tags = {
    Name = "terraformTraining_public_subnet_1"
  }
}
resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.cidr_subnet_private_2
  availability_zone = element(var.availability_zones,2)

  tags = {
    Name = "terraformTraining_private_subnet_2"
  }
}
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.cidr_subnet_public_2
  availability_zone = element(var.availability_zones,2)

  tags = {
    Name = "terraformTraining_public_subnet_2"
  }
}

////////////////////////////////////////////////////////////////////////
//Internet Gateways With Attachments
resource "aws_internet_gateway" "ig_public_subnet_1" {
    vpc_id = aws_vpc.vpc.id
   tags = {
    Name = "terraformTraining_ig_public_subnet_1"
  } 
}


////////////////////////////////////////////////////////////////////////
// Route tables
resource "aws_route_table" "route_table1" {

    vpc_id = aws_vpc.vpc.id
    route {

        cidr_block = var.cidr_block_route_table
        gateway_id = aws_internet_gateway.ig_public_subnet_1.id
    }


    tags = {

        Name = "terraformTraining_route_table_az1"
    }

}

resource "aws_route_table" "route_table2" {

    vpc_id = aws_vpc.vpc.id
    route {

        cidr_block = var.cidr_block_route_table
        gateway_id = aws_internet_gateway.ig_public_subnet_1.id
    }


    tags = {

        Name = "terraformTraining_route_table_az2"
    }

}

resource "aws_route_table_association" "association_subnet1" {

    subnet_id      = aws_subnet.public_subnet_1.id 
    route_table_id = aws_route_table.route_table1.id

}
resource "aws_route_table_association" "association_subnet2" {

    subnet_id      = aws_subnet.public_subnet_2.id
    route_table_id = aws_route_table.route_table2.id

}