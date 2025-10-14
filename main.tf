# locals {

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = "${var.cidr_prefix}.0.0/${var.vpc_mask}"

  azs             = ["${var.region}a", "${var.region}b"]
  private_subnets = ["${var.cidr_prefix}.101.0/${var.subnet_mask}", "${var.cidr_prefix}.102.0/${var.subnet_mask}"]
  public_subnets  = ["${var.cidr_prefix}.1.0/${var.subnet_mask}", "${var.cidr_prefix}.2.0/${var.subnet_mask}"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

}

resource "aws_secretsmanager_secret" "consul_servers" {
  name = "consul_servers"
}

resource "aws_kms_key" "consul_servers" {
  description             = "KMS key for Consul Server Keys"
  deletion_window_in_days = 10
}

####
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic and all outbound traffic"
  vpc_id      = module.vpc_id

  tags = {
    Name = "allow_ssh"
  }
}
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
####


resource "aws_key_pair" "management_key" {
  key_name   = "management"
  public_key = var.management_pubkey
}
