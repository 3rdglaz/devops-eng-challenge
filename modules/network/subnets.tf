resource "aws_subnet" "private-subnet-a" {
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = var.cidr-private-subnet-a
  availability_zone = var.availability-zone-subnet-a

  tags = {
    Department  = "DevOps" 
    Environment = "Production" 
    Name   = "private-subnet-a-us-east-2" 
    Owner       = "Terraform" 
    Project     = "noticias-nuvem" 
  }
}
resource "aws_subnet" "private-subnet-b" {
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = var.cidr-private-subnet-b
  availability_zone = var.availability-zone-subnet-b

  tags = {
    Department  = "DevOps" 
    Environment = "Production" 
    Name   = "private-subnet-b-us-east-2" 
    Owner       = "Terraform" 
    Project     = "noticias-nuvem" 
  }
}
resource "aws_subnet" "public-subnet-a" {
  vpc_id                  = aws_vpc.mainvpc.id
  cidr_block              = var.cidr-public-subnet-a
  availability_zone       = var.availability-zone-subnet-a
  map_public_ip_on_launch = true

  tags = {
    Department  = "DevOps" 
    Environment = "Production" 
    Name   = "public-subnet-a-us-east-2" 
    Owner       = "Terraform" 
    Project     = "noticias-nuvem" 
  }
}

resource "aws_subnet" "public-subnet-b" {
  vpc_id                  = aws_vpc.mainvpc.id
  cidr_block              = var.cidr-public-subnet-b
  availability_zone       = var.availability-zone-subnet-b
  map_public_ip_on_launch = true

  tags = {
    Department  = "DevOps" 
    Environment = "Production" 
    Name   = "public-subnet-a-us-east-2" 
    Owner       = "Terraform" 
    Project     = "noticias-nuvem" 
  }
}
resource "aws_lb" "app-load-balancer" {
  name               = "application-lb-noticias-nuvem"
  internal           = false
  load_balancer_type = "application"
  security_groups    = aws_security_group.noticias-nuvem-sg.id
  subnets            = ["public-subnet-b", "public-subnet-a"]


  enable_deletion_protection = true

  access_logs {
    bucket  = module.aws_s3_bucket.lb-logs.id
    prefix  = "noticias-nuvem-lb"
    enabled = true
  }

    tags = {
    Department  = "DevOps" 
    Environment = "Production" 
    Name   = "noticias-nuvem-loadbalancer" 
    Owner       = "Terraform" 
    Project     = "noticias-nuvem" 
  }
}