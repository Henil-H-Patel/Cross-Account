# create the routes for the GMS-qa-rtb-public

resource "aws_route" "prod_new-public-rt-1" {
  route_table_id         = var.GMS-qa-rtb-public
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.internet_gateway  # Replace with your Internet Gateway ID
}

# create the routes for the GMS-qa-rtb-private


resource "aws_route" "prod_new-private-rt-1" {
  route_table_id         = var.GMS-qa-rtb-private
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.nat_gateway
}





