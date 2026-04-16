variable "vm_roles" {
  type    = list(string)
  description = "List of roles for the VMs to be provisioned"
  default = ["web1", "web2", "app1", "db1"]
}

variable "resource_group_name" {
  default = "ansible-onboarding-rg"
}

variable "location" {
  default = "South Africa North"
}
