variable "project_id" {
  type = string
}

variable "region" {
  default = "us-east4"
  type = string
}

variable "zone" {
  default = "us-east4-a"
  type= string
}

variable "num_cps" {
  default = 1
  type = number
  description = "Number of Control Planes"
}

variable "num_nodes" {
  default = 2
  type = number
  description = "Number of Nodes"
}

variable "vpc_cidr" {
  default = "10.42.0.0/16"
  type = string
  description = "VPC CIDR"
}

variable "pod_cidr_base" {
  default = "10.200.0.0/16"
  type = string
  description = "Base CIDR for pod cidrs"
}

# CoreDNS default deployment depends on this so don't change without changing CoreDNS deployment
variable "service_cidr_base" {
  default = "10.32.0.0/24"
  type = string
  description = "Base CIDR for pod cidrs"
}

locals {
  cp_cidr_base = cidrsubnet(var.vpc_cidr, 1, 0)
  node_cidr_base = cidrsubnet(var.vpc_cidr, 1, 1)
  service_ip = cidrhost(var.service_cidr_base, 1)
  # CoreDNS default deployment depends on this so don't change without changing CoreDNS deployment
  cluster_dns_ip = cidrhost(var.service_cidr_base, 10)
  pod_node_cidrs = [for idx in range(var.num_nodes): cidrsubnet(var.pod_cidr_base, 5, idx)]
}
