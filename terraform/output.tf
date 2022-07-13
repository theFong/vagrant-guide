output "key_pair_name" {
  value = module.key_pair.key_name
}
output "private_key_path" {
  value = local.private_key_path
}

output "ami" {
  value = local.ami
}

output "instance_type" {
  value = var.instance_type
}

output "security_group" {
  value = aws_security_group.sg.name
}

output "aws_profile" {
  value = var.aws_profile
}

output "ssh_username" {
  value = var.ssh_username
}
