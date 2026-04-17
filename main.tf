terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# 1. Security Group (The Firewall)
resource "aws_security_group" "ssh_access" {
  name        = "devops-lab-ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    description = "SSH from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops-lab-sg"
  }
}

# 2. Key Pair (Uses the RSA key we fixed earlier)
resource "aws_key_pair" "deployer" {
  key_name   = "oladayo-lab-key"
  public_key = file("~/.ssh/id_rsa_ansible.pub")
}

# 3. Provision the 4 Ubuntu Instances
resource "aws_instance" "nodes" {
  for_each      = toset(var.server_roles)
  
  ami                    = var.ubuntu_ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.ssh_access.id]

  tags = {
    Name = "vm-${each.value}"
    Role = each.value
  }

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }
}
