variable "ami-wordpress" {
  description = "AMI"
  default = "" // Amazon Linux
}
variable "instance_type" {
  description = "Instance Type"
  type        = string
  default     = "t3a.small"
}

variable "min_size" {
  description = "Minimum number of instances"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of instances"
  type        = number
  default     = 8
}

variable "desired_capacity" {
  description = "Desired capacity"
  type        = number
  default     = 1
}