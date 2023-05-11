variable "client_name" {
  type        = string
  description = "The name of the client associated with the infrastructure."
  default     = "myclient"
}

variable "environment" {
  type        = string
  description = "The name of the environment (e.g. 'dev', 'qa', 'prod')."
  default     = "dev"
}

variable "resource_group_name" {
  type        = string
  description = "The type of resource to create in Azure (e.g. 'aks/vms')."
  default     = "myresourcegroup"
}

variable "resource_group_location" {
  type        = string
  description = "The location where the resource group will be created in Azure (e.g. 'eastus')."
  default     = "eastus"
}

variable "address_space" {
  type        = string
  description = "The address space to be used for the Azure virtual network."
  default     = "["10.0.0.0/16"]"
}


variable "address_prefixes1" {
  type        = string
  description = "For each subnet, create an object that contain fields."
  default     = "["10.0.1.0/24"]"
}


variable "address_prefixes2" {
  type        = string
  description = "For each subnet, create an object that contain fields."
  default     = "["10.0.2.0/24"]"
}
