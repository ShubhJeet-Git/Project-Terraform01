output "bastion_public_ip" {
    value = aws_instance.bastion.public_ip
  }

  output "vpc_id" {
    value = aws_vpc.myapp_vpc.id
    description = "VPC id"
    }

    output "igw_name" {
        value = lookup(var.igw_name,"Name")
        description = "Internet Gateway"
      
}
output "nat_igw_name" {
   value = lookup(var.nat_igw_name, "Name")
  description = "Internet Nat Gateway"
}
