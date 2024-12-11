terraform {
  backend "s3" {
    bucket         = "prod-new-vpc"
    key            = "terraform.tfstate"
    region         = "us-west-2" #***
    encrypt        = true
   
  }
}