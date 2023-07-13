resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket-name

  tags = {
    Department  = "DevOps" 
    Environment = "Production" 
    Name   = "noticias-nuvem-${var.bucket-name}" 
    Owner       = "Terraform" 
    Project     = "noticias-nuvem" 
  }
}
