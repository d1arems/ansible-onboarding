variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-north-1"
}

variable "server_roles" {
  description = "List of roles for the instances to be provisioned"
  type        = list(string)
  default     = ["web1", "web2", "app1", "db1"]
}

variable "instance_type" {
  description = "The EC2 instance size"
  type        = string
  default     = "t3.micro" # Free Tier eligible
}

variable "ubuntu_ami" {
  description = "AMI ID for Ubuntu 22.04 LTS"
  type        = string
  default     = "ami-080254318c2d8932f" # Specific to eu-north-1
}
