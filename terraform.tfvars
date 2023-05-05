/******************************************
  Common
******************************************/
client_name                 = "samsung"
environment                 = "prod"

/******************************************
  resource group
******************************************/
resource_group_name         = "rg"
resource_group_location     = "eastus"

/******************************************
  AKS Basic
******************************************/
cluster_resource_group         = "rg-cvs-poc"
node_resource_group            = "MC_rg-aks-cvs-prod_m-by-azure"
kubernetes_master_version      = "1.24.9"
location                       = "eastus"
cluster_name                   = "aks"
sku_tier                       = "Free"

/******************************************
  Node pools
******************************************/
enable_auto_scaling             =    true
enable_host_encryption          =    false
enable_node_public_ip           =    false
max_count                       =    5
max_pods                        =    110
min_count                       =    1
node_pool_name                  =    "agentpool"
node_labels                     =    {}     # {key1 = "Value1", key2 = "value2"}
kubelet_disk_type               =    "OS"
node_taints                     =    []
kubernetes_node_version         =    "1.24.9"
os_disk_size_gb                 =    100
os_disk_type                    =    "Managed"
os_sku_image                    =    "Ubuntu"
node_pool_type                  =    "VirtualMachineScaleSets"
ultra_ssd_enabled               =    false
node_pool_vm_size               =    "Standard_DS2_v2"      #https://learn.microsoft.com/en-us/azure/virtual-machines/sizes
node_pool_zones                 =    ["1", "2", "3"]
fips_enabled                    =     false
only_critical_addons_enabled    =     false

/******************************************
  Access
******************************************/
local_account_disabled              = false
role_based_access_control_enabled   = false
identity_type                       = "SystemAssigned"

/******************************************
  Networking
******************************************/
network_plugin                      =   "kubenet"
outbound_type                       =   "loadBalancer"
load_balancer_sku                   =   "standard"
network_policy                      =   "calico"

/******************************************
  Integration
******************************************/
azure_policy_enabled                =   false
private_dns_zone_id                 =   "System"
dns_prefix                          =   "aks-cvs-prod-dns"
public_network_access_enabled       =   true
private_cluster_enabled             =   true
private_cluster_public_fqdn_enabled =   true
enable_pod_security_policy          =   false
http_application_routing_enabled    =   false
open_service_mesh_enabled           =   false

/******************************************
  Tags and timeout
******************************************/
tags                                =  {} #{key1 = "Value1", key2 = "value2"}
