variable "vm" {
  type = object({
    autostart              = bool
    base_volume_image_url  = string
    bridge_interface_name  = string
    count                  = string
    name_prefix            = string
    hostname               = string
    memory                 = string
    network_interface_name = string
    root_passwd            = string
    root_volume_size       = string
    ssh_key                = string
    storage_pool_name      = string
    time_zone              = string
    username               = string
    vcpu                   = string
  })
  default = {
    autostart              = true
    base_volume_image_url  = "https://cdimage.debian.org/cdimage/cloud/sid/daily/20210425-618/debian-sid-generic-amd64-daily-20210425-618.qcow2"
    bridge_interface_name  = "virbr0"
    count                  = 1
    hostname               = "localhost"
    name_prefix            = "kvm"
    memory                 = 1024
    network_interface_name = "ens3"
    root_passwd            = ""
    root_volume_size       = 10
    ssh_key                = ""
    storage_pool_name      = "default"
    time_zone              = "Europe/Berlin"
    username               = "walter"
    vcpu                   = 1
  }
}
