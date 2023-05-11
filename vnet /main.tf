resource "azurerm_resource_group" "az_rg" {
  name                      = "${var.resource_group_name}-${var.client_name}-${var.environment}"
  location                  = var.resource_group_location
  tags                      = {
      environment           = var.environment
      client                = var.client_name
  }
}


resource "azurerm_virtual_network" "example" {
  name                = "VNET-${var.resource_group_name}-${var.client_name}-${var.environment}-by-Azure"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = var.address_space
}

resource "azurerm_subnet" "example1" {
  name                 = "SUBNET1-${var.resource_group_name}-${var.client_name}-${var.environment}-by-Azure"
  resource_group_name  = azurerm_resource_group.example1.name
  virtual_network_name = azurerm_virtual_network.example1.name
  address_prefixes     = var.address_prefixes1
}

resource "azurerm_subnet" "example2" {
  name                 = "SUBNET2-${var.resource_group_name}-${var.client_name}-${var.environment}-by-Azure"
  resource_group_name  = azurerm_resource_group.example2.name
  virtual_network_name = azurerm_virtual_network.example2.name
  address_prefixes     = var.address_prefixes2
}
