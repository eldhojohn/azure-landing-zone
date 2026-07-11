output "vm_id" {
  value = azurerm_windows_virtual_machine.management.id
}

output "vm_name" {
  value = azurerm_windows_virtual_machine.management.name
}

output "private_ip_address" {
  value = azurerm_network_interface.management_vm.private_ip_address
}