variable "cidr-vpc" {
  type        = string
  description = "simple cidr, default is 10.0.0.0/16"
  default     = "10.0.0.0/16"
}
variable "instance_tags" {
  type = map(string)
  default = {
    Name        = "main-vpc"
    Project     = "noticias-nuvem"
    Environment = "Production"
    Owner       = "Terraform"
    Department  = "DevOps"
  }
}

variable "cidr-private-subnet-a" {
  type = string
  description = "subnet cidr, default is 10.0.0.0/18"
  default = "10.0.0.0/18"
}
variable "cidr-private-subnet-b" {
  type = string
  description = "subnet cidr, default is 10.0.64.0/18"
  default = "10.0.64.0/18"
}
variable "cidr-public-subnet-a" {
  type = string
  description = "subnet cidr, default is 10.0.128.0/18"
  default = "10.0.128.0/18"
}
variable "cidr-public-subnet-b" {
  type = string
  description = "subnet cidr, default is 10.0.192.0/18"
  default = "10.0.192.0/18"
}
variable "availability-zone-subnet-a" {
  type = string
  description = "subnet availability zone a"
  default = "us-east-2a"
}
variable "availability-zone-subnet-b" {
  type = string
  description = "subnet availability zone b"
  default = "us-east-2b"
}