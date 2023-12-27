terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = ""
  client_secret   = ""
  subscription_id = "62974f8c-157b-47a7-918d-d076da5ee1e4"
  tenant_id       = "c794763f-6817-478e-b3f0-81235c563d9d"
}

module "networking" {
  source = "./networking-module"
  resource_group_name = "patrick-devops"
  location = "UK South"
  vnet_address_space = ["10.0.0.0/16"]

}
#Three variables here are passed into variables.tf in networking-module to be used to create resources

module "aks_cluster" {
  source = "./aks-cluster-module"

  # Input variables for the AKS cluster module
  aks_cluster_name           = "patrickaks"
  cluster_location           = "UK South"
  dns_prefix                 = "patrickaksserver"
  kubernetes_version         = "1.27.3"  # Adjust the version as needed
  service_principal_client_id = ""
  service_principal_client_secret = ""

  #New variables are passed into aks-cluster-module into the variables.tf

  # Input variables referencing outputs from the networking module
  resource_group_name         = module.networking.resource_group_name
  vnet_id                     = module.networking.vnet_id
  control_plane_subnet_id     = module.networking.control_plane_subnet_id
  worker_node_subnet_id       = module.networking.worker_node_subnet_id
  aks_nsg_id                  = module.networking.aks_nsg_id

  #These variables are passed from networking into the variables of aks-cluster-module to be used
}


