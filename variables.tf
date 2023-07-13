variable "ami-wordpress" {
  description = "AMI"
  default = "ami-8c1be5f6" // Amazon Linux
}

variable "instance_type" {
  type = string
  description = "EC2 instance type"
  default = "t2.micro"
}