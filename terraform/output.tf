output "aws_config" {
  value       = module.key_pair.key_name
  description = "the aws config that must be amended"
}
