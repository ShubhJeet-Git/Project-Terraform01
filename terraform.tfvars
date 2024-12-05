vpc_name ={
      "Name" = "ter-vpc"
      "Description" = "vpc created for terraform practical"  
    }
vpc_cidr = "10.20.0.0/16"
pub_subnet_cidr = "10.20.1.0/24"
prv_subnet_cidr = "10.20.2.0/24"
pub_subnet_name = {
  "Name" = "public_subnet"
}
prv_subnet_name = {
      "Name" = "private_subnet"
    }  
igw_name = {
  "Name" = "ter-igw"
  "Description" = "internet gateway for public subnet"
}
pub_route_cidr = "0.0.0.0./0"
Pub_route_table_tag=  {
      "Name" = "public_route_table"
      "Description"= "route table for public subnet "
    }
aws_instant_tag = {
    "Name" = "myEC2Instance"
    "Description" = "EC2 created for terraform practical"
       
    }
