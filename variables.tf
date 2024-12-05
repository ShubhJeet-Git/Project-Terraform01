variable "vpc_name" {
  type = map(string)
  default = {
    "name" = "ter-vpc"
    "Description" = "vpc created for terraform practical"
  }
}

variable "vpc_cidr" {
  type = string
  default = "10.20.0.0/16"
}

variable "pub_subnet_cidr" {
  type = string
  default = "10.20.1.0/24"
}

variable "pub_route_cidr" {
  type = string
  #default = "0.0.0.0/0"
}

variable "prv_subnet_cidr" {
  type = string
  default = "10.20.2.0/24"
}

variable "pub_subnet_name" {
  type = map(string)
  default = {
    "Name"="public_subnet"  
    }
}

variable "prv_subnet_name" {
  type = map(string)
  default = {
    "Name" = "private_subnet"
  }
}

variable "igw_name" {
  type = map(string)
  default = {
    "Name" = "ter-igw"
  }
}

variable "nat_igw_name" {
  type = map(string)
  default = {
    "Name" = "nat_ter-igw"
  }
}


variable "cidr" {
  type = string
  default = "0.0.0.0/0"
}


variable "Pub_route_table_tag" {
  type = map(string)
  default = {
    "Name" = "pub_route_table"
  }
}


variable "Prv_route_table_tag" {
   type = map(string)
    default = {
      "Name" = "prv_route_table"
    }
}


variable "instance_type" {
  type = list(string)
  default = ["t2.micro","t2.nano"]
}

variable "ami" {
  type = list(string)
  default = ["ami-0453ec754f44f9a4a","ami-0453ec754f44f9a4a"]
}


variable "aws_instant_tag" {
  type = map(string)
  default = {
    "Name" = "myEC2Instance"
    "Description" = "EC2 created for terraform practical"
  }
}



variable "use_pub_ip" {
     type = bool
  default = false
    description = "Set to true to assign public ip,false otherwise"
  }







