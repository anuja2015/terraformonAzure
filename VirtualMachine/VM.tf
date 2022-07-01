resource "azurerm_linux_virtual_machine" "VM" {
    name = "myVM"
    resource_group_name = azurerm_resource_group.RG.name
    location = azurerm_resource_group.RG.location
    network_interface_ids = [ 
        azurerm_network_interface.VM-NIC.id,
    ]
    size = "Standard_DC1ds_v3"
    admin_username = "adminuser1"
    admin_password = "Padmasree@2022"
    disable_password_authentication = "false"

    os_disk {
    storage_account_type = "Standard_LRS"
    caching = "ReadWrite"
    }
    source_image_reference {
    offer  = "0001-com-ubuntu-server-focal"
    publisher = "Canonical"
    sku = "20_04-lts-gen2"
    version = "latest"


    }

}