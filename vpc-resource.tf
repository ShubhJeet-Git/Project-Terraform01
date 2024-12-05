resource "aws_vpc" "myapp_vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    
tags = var.vpc_name
}

resource "aws_subnet" "pub_subnet" {
    vpc_id = aws_vpc.myapp_vpc.id
    cidr_block = var.pub_subnet_cidr
    tags = var.pub_subnet_name
    map_public_ip_on_launch = true 
}

resource "aws_subnet" "prv_subnet" {
    vpc_id = aws_vpc.myapp_vpc.id
    cidr_block = var.prv_subnet_cidr 
    #availability_zone = "ap-south-1a"
    tags = var.prv_subnet_name
}

resource "aws_internet_gateway" "vpc_igw" {
tags =var.igw_name
}

resource "aws_internet_gateway_attachment" "name" {
  vpc_id = aws_vpc.myapp_vpc.id
  internet_gateway_id = aws_internet_gateway.vpc_igw.id
}


# Create an Elastic IP for the NAT Gateway
resource "aws_eip" "nigw-eip" {
  depends_on = [aws_internet_gateway.vpc_igw]
}

#create NAT Gateway
resource "aws_nat_gateway" "nat_igw" {
  allocation_id = aws_eip.nigw-eip.id
 subnet_id     = aws_subnet.pub_subnet.id
 depends_on = [ aws_eip.nigw-eip ]
  tags =var.nat_igw_name
  }

resource "aws_route_table" "pub_route" {
    vpc_id = aws_vpc.myapp_vpc.id
    route {
        gateway_id = aws_internet_gateway.vpc_igw.id
        cidr_block = var.cidr
    }
  tags = var.Pub_route_table_tag
}

#attaching public route table to public subnet
resource "aws_route_table_association" "public_subnet_route" {
  subnet_id = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.pub_route.id
}

#private route table Add a route to the NAT Gateway in the private route table
resource "aws_route_table" "private_rt" {
 vpc_id = aws_vpc.myapp_vpc.id
  tags ={
  Name="private_route_table"
  }
}

# Add a route to the NAT Gateway in the private route table
resource "aws_route" "private_nat" {
  route_table_id = aws_route_table.private_rt.id
  destination_cidr_block = var.cidr
  nat_gateway_id         = aws_nat_gateway.nat_igw.id
}

#attaching private route table to private subnet 
resource "aws_route_table_association" "private_association" {
  subnet_id = aws_subnet.prv_subnet.id
  route_table_id = aws_route_table.private_rt.id
}


# Create a Security Group for Bastion Host and private EC2 instance


resource "aws_instance" "my_ec2" {
  count = 2
  
  ami           = "ami-0453ec754f44f9a4a" 
  instance_type = "t2.micro"

  tags = {
    Name = "my_ec2-vm-${count.index }"
  }
}

