resource "libvirt_domain" "vm" {
  count = var.vm.count

  name       = format("${var.vm.name_prefix}%02d", count.index + 1)
  memory     = var.vm.memory
  vcpu       = var.vm.vcpu
  autostart  = var.vm.autostart
  qemu_agent = true

  cloudinit = element(libvirt_cloudinit_disk.cloudinit.*.id, count.index)

  network_interface {
    bridge         = var.vm.bridge_interface_name
    wait_for_lease = true
    hostname       = format("${var.vm.name_prefix}%02d", count.index + 1)
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  disk {
    volume_id = element(libvirt_volume.root_volume.*.id, count.index)
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}

resource "libvirt_volume" "base_volume" {
  name   = format("${var.vm.name_prefix}_base.qcow2")
  pool   = var.vm.storage_pool_name
  source = var.vm.base_volume_image_url
  format = "qcow2"
}

resource "libvirt_volume" "root_volume" {
  count          = var.vm.count
  name           = format("${var.vm.name_prefix}_root%02d.qcow2", count.index + 1)
  pool           = var.vm.storage_pool_name
  size           = 1024 * 1024 * 1024 * var.vm.root_volume_size
  base_volume_id = libvirt_volume.base_volume.id

  format = "qcow2"
}

resource "libvirt_cloudinit_disk" "cloudinit" {
  count          = var.vm.count
  name           = format("${var.vm.name_prefix}_init%2d.iso", count.index + 1)
  user_data      = data.template_cloudinit_config.init_config[count.index].rendered
  network_config = data.template_file.network_config[count.index].rendered
  pool           = var.vm.storage_pool_name
}


data "template_file" "network_config" {
  count    = var.vm.count
  template = file("${path.module}/templates/network_dhcp.yaml")
  vars = {
    nic = var.vm.network_interface_name
  }
}

data "template_file" "init_config" {
  count    = var.vm.count
  template = file("${path.module}/templates/cloud_init.yaml")
  vars = {
    user        = var.vm.username
    ssh_key     = var.vm.ssh_key
    root_passwd = var.vm.root_passwd
    hostname    = format("${var.vm.name_prefix}%02d", count.index + 1)
    time_zone   = var.vm.time_zone
  }
}

data "template_cloudinit_config" "init_config" {
  count         = var.vm.count
  gzip          = false
  base64_encode = false

  part {
    filename     = format("init%02d.cfg", count.index + 1)
    content_type = "text/cloud-config"
    content      = data.template_file.init_config[count.index].rendered
  }
}

output "name" {
  value = libvirt_domain.vm.*.name
}
output "ips" {
  value = libvirt_domain.vm.*.network_interface.0.addresses.0
}
