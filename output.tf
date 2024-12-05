
  output "vpc_id" {
    value = aws_vpc.myapp_vpc.id
    description = "VPC id"
    }

    output "igw_name" {
        value = lookup(var.igw_name,"Name")
        description = "Internet Gateway"
      
}
