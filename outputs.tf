output "cloudinit" {
  value = local.cloudinit_tmpl
}
output "name" {
  value = libvirt_domain.vm.*.name
}
output "ips" {
  value = libvirt_domain.vm.*.network_interface.0.addresses.0
}
output "count" {
  value = var.vm.vm_count
}
