output "GMS-qa-rtb-private" {
  value = aws_route_table.private-subnet-1a.id
}


output "GMS-qa-rtb-public" {
  value = aws_route_table.Public-subnet.id
}


