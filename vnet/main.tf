resource "azurerm_virtual_network" "vnet" {
  count               = length(var.vnet)
  name                = lookup(var.vnet[count.index], "name")
  address_space       = lookup(var.vnet[count.index], "address_space")
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "subnet" {
  count                = length(var.subnet)
  name                 = lookup(var.subnet[count.index], "name")
  resource_group_name  = var.rg_name
  virtual_network_name = element(azurerm_virtual_network.vnet.*.name, count.index)
  address_prefixes     = lookup(var.subnet[count.index], "address_prefixes")
}
