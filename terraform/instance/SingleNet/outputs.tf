output "external_ip_address_vm" {
  value = {
    for vm_inst in yandex_compute_instance.vm :
    vm_inst.name => vm_inst.network_interface.0.nat_ip_address
  }
}