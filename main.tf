provider "aws" {
    region = var.region_name
}

# ============= for the vpc ====================

module "vpc" {
    source = "./modules/stage/vpc"
    vpc_cidr = var.vpc_cidr
    private_subnet_1a = var.private_subnet_1a
    private_subnet_1b = var.private_subnet_1b
    public_subnet_1a = var.public_subnet_1a 
    public_subnet_1b = var.public_subnet_1b
  
}

# ============= for the nat gateway -===============

module "nat-gateway"{
    source = "./modules/stage/nat-gateway"
    public_subnet-1a = module.vpc.public_subnet-1a
}


# ============= for the internet gateway -===============

module "internet-gateway"{
    source = "./modules/stage/internet-gateway"
    vpc_id = module.vpc.vpc_id
}

# ================ security group ======================= 


module "prod_new_default" {
    source = "./modules/stage/prod_new-default"
    vpc_id = module.vpc.vpc_id
  
}


# ============================  for the route table =======

module "route-table" {
    source = "./modules/stage/route-table"
    vpc_id = module.vpc.vpc_id
    private_subnet-1a = module.vpc.private_subnet-1a
    private_subnet-1b =module.vpc.private_subnet-1b
    public_subnet-1a = module.vpc.public_subnet-1a 
    public_subnet-1b = module.vpc.public_subnet-1b
    nat_gateway = module.nat-gateway.nat_gateway
    internet_gateway = module.internet-gateway.internet_gateway
   
}

# ============== for the route table routes ==============

module "route-table-routes" {
    source = "./modules/stage/route-table-routes"
    nat_gateway = module.nat-gateway.nat_gateway
    GMS-qa-rtb-private = module.route-table.GMS-qa-rtb-private
    GMS-qa-rtb-public = module.route-table.GMS-qa-rtb-public
    internet_gateway = module.internet-gateway.internet_gateway
    
  
}











