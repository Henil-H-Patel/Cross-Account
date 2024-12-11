 resource "aws_security_group" "GMS_qa_vpc" {
    name = "GMS-qa-vpc_default"
    description = "GMS-qa-vpc_default"
    vpc_id = var.vpc_id
}


# All traffic 


# inbound rule :

resource "aws_security_group_rule" "GMS_qa_1" {
  type        = "ingress"
  from_port   = 0
  to_port     = 65535
  protocol    = "all"
  cidr_blocks = ["172.22.0.0/20"]
  security_group_id = aws_security_group.GMS_qa_vpc.id
  description = "nethub vpn"
}


# resource "aws_security_group_rule" "GMS_qa_2" {
#   type        = "ingress"
#   from_port   = 0
#   to_port     = 65535
#   protocol    = "all"
#   cidr_blocks = ["172.20.0.0/20"]
#   security_group_id = aws_security_group.GMS_qa_vpc.id
#   description = "shared services"
# }



# resource "aws_security_group_rule" "GMS_qa_3" {
#   type        = "ingress"
#   from_port   = 0
#   to_port     = 65535
#   protocol    = "all"
#   cidr_blocks = ["172.21.0.0/20"]
#   security_group_id = aws_security_group.GMS_qa_vpc.id
#   description = "nethub vpc"
# }


# resource "aws_security_group_rule" "GMS_qa_4" {
#   type        = "ingress"
#   from_port   = 0
#   to_port     = 65535
#   protocol    = "all"
#   source_security_group_id =  aws_security_group.GMS_qa_vpc.id
#   security_group_id = aws_security_group.GMS_qa_vpc.id

# }


# outbound 


resource "aws_security_group_rule" "GMS_qa_4" {
  type        = "egress"
  from_port   = 0
  to_port     = 65535
  protocol    = "all"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.GMS_qa_vpc.id

}