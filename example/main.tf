module "vm_example" {
  source = "../"

  vm = var.vm

  network_id = var.network_id
}

output "name" {
  value = module.vm_example.name
}

output "ips" {
  value = module.vm_example.ips
}
