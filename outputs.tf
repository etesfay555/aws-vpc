output "aws_vpn_gateway_id" {
  description = "The ID of the VPN Gateway"
  value       = module.vpc.vgw_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "default_route_table_id" {
  value = module.vpc.vpc_main_route_table_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr_block
}

output "region" {
  value = var.region
}

output "management_key" {
  value = aws_key_pair.management_key.key_name
}

output "ssh_sg" {
  value = aws_security_group.allow_ssh.id
}

output "vault_acm_cert" {
  value = aws_security_group.allow_ssh.id
}

output "consul_secrets_manager_arn" {
  value = aws_secretsmanager_secret.consul_servers.arn
}

output "consul_aws_kms_key_arn" {
  value = aws_kms_key.consul_servers.arn
}

# # Output for the IAM role
# output "hashistack_role_arn" {
#   value       = aws_iam_role.hashistack_role.arn
#   description = "The ARN of the hashistack IAM role."
# }

# # Optional: Output for the Instance Profile
# output "hashistack_instance_profile_name" {
#   value       = aws_iam_instance_profile.hashistack_instance_profile.name
#   description = "The name of the hashistack instance profile."
# }
