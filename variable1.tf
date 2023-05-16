/******************************************
  Common
******************************************/

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

/******************************************
  resource group
******************************************/

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


/******************************************
  AKS Basic
******************************************/

variable "cluster_resource_group" {
  description = "The name of the resource group that contains the Kubernetes cluster."
  type        = string
  default     = "myclusterresourcegroup"
}

variable "node_resource_group" {
  description = "The name of the resource group that contains the Kubernetes nodes."
  type        = string
  default     = "mynoderesourcegroup"
}

variable "kubernetes_master_version" {
  description = "The version of Kubernetes to use for the Kubernetes cluster."
  type        = string
  default     = "1.21.1"
}

variable "location" {
  description = "The location of the Kubernetes cluster."
  type        = string
  default     = "eastus"
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster."
  type        = string
  default     = "mycluster"
}

variable "sku_tier" {
  description = "The SKU tier of the Kubernetes cluster."
  type        = string
  default     = "Free"
}

/******************************************
  Node pools
******************************************/

variable "enable_auto_scaling" {
  type        = bool
  description = "Whether or not to enable auto scaling for the node pool"
  default     = true
}

variable "enable_host_encryption" {
  type        = bool
  description = "Whether or not to enable host encryption for the node pool"
  default     = false
}


variable "max_count" {
  type        = number
  description = "The maximum number of nodes allowed in the node pool"
  default     = 10
}

variable "max_pods" {
  type        = number
  description = "The maximum number of pods that can run on each node in the node pool"
  default     = 30
}

variable "min_count" {
  type        = number
  description = "The minimum number of nodes allowed in the node pool"
  default     = 1
}

variable "node_pool_name" {
  type        = string
  description = "The name of the node pool"
  default     = "default"
}

variable "node_labels" {
  type        = map(string)
  description = "A map of labels to apply to each node in the node pool"
  default     = {}
}

variable "kubelet_disk_type" {
  type        = string
  default     = "OS"
  description = "The type of disk to use for the Kubelet on each node in the node pool (either 'OS' or 'Data')"
}

variable "node_taints" {
  type        = list(string)
  description = "List of taints to apply to each node in the node pool"
  default     = ["key1=value1:NoSchedule", "key2=value2:NoExecute"]
}

variable "kubernetes_node_version" {
  type        = string
  description = "The version of the orchestrator(node-pool) to use for the managed cluster"
  default     = "1.20.5"
}

# The size of the OS disk to use for each node in the node pool
variable "os_disk_size_gb" {
  type        = number
  description = "The size of the OS disk to use for each node in the node pool"
  default     = 128
}

variable "os_disk_type" {
  type        = string
  description = "The type of OS disk to use for each node in the node pool (either 'Managed' or 'Ephemeral')"
  default     = "Managed"
}

variable "os_sku_image" {
  type        = string
  description = "The SKU of the OS image to use for each node in the node pool"
  default     = "Ubuntu"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to apply to each resource created by the module"
  default     = {
    Environment = "dev",
    Project     = "my-project",
  }
}

variable "node_pool_type" {
  type        = string
  description = "The type of the managed cluster (either 'VirtualMachineScaleSets' or 'AvailabilitySet')"
  default     = "VirtualMachineScaleSets"
}

variable "ultra_ssd_enabled" {
  type        = bool
  description = "Boolean value indicating whether or not UltraSSD is enabled for the managed cluster"
  default     = true
}

variable "node_pool_vm_size" {
  type        = string
  description = "The VM size to use for each node in the node pool"
  default     = "Standard_D4s_v3"
}

variable "node_pool_zones" {
  type        = list(string)
  description = "The list of zones to spread the nodes across"
  default     = ["1", "2", "3"]
}

variable "fips_enabled" {
  type        = bool
  description = "Enable FIPS for the default node pool"
  default     = false
}

variable "only_critical_addons_enabled" {
  type        = bool
  description = "Enable only critical addons for the default node pool"
  default     = true
}

/******************************************
  ACCESS
******************************************/
variable "local_account_disabled" {
  description = "Specifies whether local account authentication is disabled for the Kubernetes cluster."
  type        = bool
  default     = true
}

variable "role_based_access_control_enabled" {
  description = "Specifies whether role-based access control (RBAC) is enabled for the Kubernetes cluster."
  type        = bool
  default     = true
}

variable "identity_type" {
  description = "The type of the managed identity to create."
  type        = string
  default     = "SystemAssigned"
}

/******************************************
  Networking
******************************************/
variable "network_plugin" {
  description = "The CNI plugin used for networking in the AKS cluster."
  type        = string
  default     = "azure"
}

variable "outbound_type" {
description = "The type of outbound connectivity for the AKS cluster."
type = string
default = "loadBalancer"
}

variable "load_balancer_sku" {
description = "The SKU of the load balancer associated with the AKS cluster."
type = string
default = "basic"
}

variable "network_policy" {
description = "The network policy plugin used for network policy enforcement in the AKS cluster."
type = string
default = "azure"
}

/******************************************
Integration
******************************************/
variable "azure_policy_enabled" {
description = "Specifies whether Azure Policy is enabled for the Kubernetes cluster."
type = bool
default = true
}

variable "private_dns_zone_id" {
description = "The ID of the private DNS zone for the Kubernetes cluster."
type = string
default = "/subscriptions/11111111-1111-1111-1111-111111111111/resourceGroups/myRG/providers/Microsoft.Network/privateDnsZones/myDNSzone"
}

variable "dns_prefix" {
description = "The DNS prefix for the Kubernetes cluster."
type = string
default = "myk8scluster"
}


variable "private_cluster_enabled" {
description = "Specifies whether the Kubernetes cluster is private."
type = bool
default = true
}



variable "enable_pod_security_policy" {
type = bool
description = "Enable pod security policy"
default = false
}

variable "http_application_routing_enabled" {
type = bool
description = "Enable HTTP application routing"
default = true
}

variable "open_service_mesh_enabled" {
type = bool
description = "Enable open service mesh"
default = false
}


variable "secret_rotation_enabled" {
type = bool
description = "Enable open service mesh"
default = true
}


variable "secret_rotation_interval" {
type = string
description = "Enable open service mesh"
default = "10"
}
