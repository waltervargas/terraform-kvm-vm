module "vm_example" {
  source = "../"

  vm = var.vm
}

output "name" {
  value = module.vm_example.name
}

output "ips" {
  value = module.vm_example.ips
}
