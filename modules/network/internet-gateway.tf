resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.mainvpc.id

  tags = {
    Department  = "DevOps" 
    Environment = "Production" 
    Name   = "noticias-nuvem-internet-gateway" 
    Owner       = "Terraform" 
    Project     = "noticias-nuvem" 
  }
}