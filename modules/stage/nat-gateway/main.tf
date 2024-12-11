# In order to create the NAT gateway, first I need to create the elastic ip for that

resource "aws_eip" "nat_eip" {
  instance = null # Leave instance as null to create a standalone EIP
}

# Now, create the NAT Gateway itself, specifying the public subnet where it should reside and the EIP to associate with it.

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.public_subnet-1a # Replace with the actual public subnet ID

  tags = {
    Name = "GMS-qa-nat-public1-us-west-2a"
  }
}