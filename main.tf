module  "rg" {
    source                                  =   "./modules/rg"
    client_name                             =   var.client_name
    environment                             =   var.environment
    resource_group_name                     =   var.resource_group_name
    resource_group_location                 =   var.resource_group_location
}

module  "aks" {
    source                                  =   "./modules/aks"
    client_name                             =   var.client_name
    cluster_name                            =   "${var.cluster_name}-${var.client_name}-${var.environment}"
    kubernetes_master_version               =   var.kubernetes_master_version
    environment                             =   var.environment
    sku_tier                                =   var.sku_tier
    location                                =   var.location
    kubernetes_node_version                 =   var.kubernetes_node_version
    node_pool_name                          =   var.node_pool_name 
    node_pool_vm_size                       =   var.node_pool_vm_size
    node_pool_type                          =   var.node_pool_type
    max_pods                                =   var.max_pods
    os_disk_type                            =   var.os_disk_type
    os_disk_size_gb                         =   var.os_disk_size_gb
    ultra_ssd_enabled                       =   var.ultra_ssd_enabled
    os_sku_image                            =   var.os_sku_image
    node_taints                             =   var.node_taints
    node_labels                             =   var.node_labels
    enable_host_encryption                  =   var.enable_host_encryption
    enable_auto_scaling                     =   var.enable_auto_scaling
    max_count                               =   var.max_count
    min_count                               =   var.min_count
    node_pool_zones                         =   var.node_pool_zones
    fips_enabled                            =   var.fips_enabled
    only_critical_addons_enabled            =   var.only_critical_addons_enabled
    resource_group_name                     =   var.resource_group_name
    network_policy                          =   var.network_policy
    local_account_disabled                  =   var.local_account_disabled
    role_based_access_control_enabled       =   var.role_based_access_control_enabled
    identity_type                           =   var.identity_type
    private_dns_zone_id                     =   var.private_dns_zone_id
    dns_prefix                              =   "${var.resource_group_name}-${var.client_name}-${var.environment}-dns"
    private_cluster_enabled                 =   var.private_cluster_enabled
    azure_policy_enabled                    =   var.azure_policy_enabled
    enable_pod_security_policy              =   var.enable_pod_security_policy
    http_application_routing_enabled        =   var.http_application_routing_enabled
    open_service_mesh_enabled               =   var.open_service_mesh_enabled

    outbound_type                           =   var.outbound_type
    network_plugin                          =   var.network_plugin
    tags                                    =   {}
    depends_on                              =   [module.rg]
}


 #addon_profile {
  #  oms_agent {
   #     enabled                    = true
    #    log_analytics_workspace_id = var.aks_log_analytics_workspace_id
     #   }
   # }
