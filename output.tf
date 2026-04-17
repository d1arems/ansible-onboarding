output "instance_public_ips" {
  description = "The public IP addresses of the provisioned instances"
  value = {
    for role, instance in aws_instance.nodes : role => instance.public_ip
  }
}

output "ssh_instructions" {
  description = "Example command to SSH into your nodes"
  value       = "ssh -i ~/.ssh/id_rsa_azure ubuntu@<IP_ADDRESS>"
}
