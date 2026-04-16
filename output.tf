output "vm_private_ips" {
  description = "The private IP addresses of the provisioned VMs"
  value = {
    for role, vm in azurerm_linux_virtual_machine.main : role => vm.private_ip_address
  }
}

output "vm_public_ips" {
  value = {
    for role, ip in azurerm_public_ip.main : role => ip.ip_address
  }
}
