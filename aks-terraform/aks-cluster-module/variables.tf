variable "aks_cluster_name" {
  description = "name of AKS cluster"
  type = string
}

variable "dns_prefix" {
  description = "authoritative name server for the cluster domain (cluster. local)"
  type = string
}

variable "kubernetes_version" {
  description = "Kubernetes version for cluster (server version not client version)"
  type = string
}

variable "service_principal_client_id" {
  description = "Client ID for service principle"
  type = string
}

variable "service_principal_client_secret" {
  description = "Service Principle Secret ID"
  type = string
}

variable "cluster_location" {
  description = "location of resources"
  type = string
}

variable "vnet_id" {
    description = "virtual network ID"
    default = "$module.networking-module.vnet_id"
    type = string
}

variable "control_plane_subnet_id" {
    description = "ID of Control plane subnet"
    default = "$module.networking-module.control_plane_subnet_id"
    type = string
}

variable "worker_node_subnet_id" {
    description = "ID of worker node subnet"
    default = "$module.networking-module.worker_node_subnet_id"
    type = string
}

variable "aks_nsg_id" {
  description = "ID of the Network Security Group (NSG) for AKS."
  default = "$module.networking-module.aks_nsg_id"
  type = string
}

variable "resource_group_name" {
  description = "resource group!"
  default = "$module.networking-module.resource_group_name"
  type = string
}