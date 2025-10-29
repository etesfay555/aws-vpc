variable "region" {
  type        = string
  default     = "us-east-2"
  description = "AWS Region"
}

variable "name" {
  type        = string
  default     = "demo"
  description = "This will be a common named used for labeling most resources"
}

variable "cidr_prefix" {
  default     = "10.0"
  description = "CDIR PREFIX for the entire VPC"
}

variable "vpc_mask" {
  default     = "16"
  description = "VPC mask"
}

variable "subnet_mask" {
  default     = "24"
  description = "Subnet mask"
}

variable "management_pubkey" {
  description = "A public key for the management server"
}

variable "my_ip" {
  default = "x.x.x.x/32"
}

variable "domain_name" {
  description = "The Domain name that is being managed"
  default     = "eden-tesfay.sbx.hashidemos.io"
}