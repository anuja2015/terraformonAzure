

resource "azurerm_virtual_network" "VMLinux-vnet" {
    name = "myVnet"
    address_space = [ "10.0.0.0/16" ]
    location = azurerm_resource_group.RG.location
    resource_group_name = azurerm_resource_group.RG.name
}

resource "azurerm_subnet" "VMlinux-subnet" {
    name = "subnet1"
    address_prefixes = ["10.0.0.0/24"]
    resource_group_name = azurerm_resource_group.RG.name
    virtual_network_name = azurerm_virtual_network.VMLinux-vnet.name
  
}

resource "azurerm_public_ip" "VMLinux-ipaddress" {
  name = "myIP"
  resource_group_name = azurerm_resource_group.RG.name
  location = azurerm_resource_group.RG.location
  allocation_method = "Static"
}

resource "azurerm_network_interface" "VM-NIC" {
    name = "mynic"
    resource_group_name = azurerm_resource_group.RG.name
    location = azurerm_resource_group.RG.location
    ip_configuration {
      name = "internal"
      public_ip_address_id = azurerm_public_ip.VMLinux-ipaddress.id
      subnet_id = azurerm_subnet.VMlinux-subnet.id
      private_ip_address_allocation = "Dynamic"
    }
  
}