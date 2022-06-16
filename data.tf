locals {
  // yamlencode is producing quoted keys yaml
  // this is a workaround while tf folks improve the yamlencode function
  // ref: https://github.com/hashicorp/terraform/issues/23322
  yaml           = replace(yamlencode(local.cloudinit_config), "\"", "")
  cloudinit_tmpl = templatefile("${path.module}/templates/cloudinit.tftpl", { "yaml" = local.yaml })
  cloudinit_config = {
    "package_upgrade" : false,
    "ssh_pwauth" : true,
    "timezone" : var.vm.time_zone,
    "fqdn" : var.vm.hostname,

    // set root password
    "chpasswd" : { "list" : "root:${var.vm.root_passwd}" }

    "packages" : [
      "qemu-guest-agent"
    ]

    // enables qemu-guest-agent
    "runcmd" : [
      ["systemctl", "daemon-reload"],
      ["systemctl", "enable", "qemu-guest-agent"],
      ["systemctl", "start", "qemu-guest-agent"]
    ],

    // define users
    "users" : [
      {
        "name" : var.vm.username,
        "gecos" : var.vm.username,
        "shell" : "/bin/bash",
        "sudo" : "ALL=(ALL) NOPASSWD:ALL",
        "system" : false,
        "lock-passwd" : false,
        "ssh_authorized_keys" : var.vm.ssh_key
      }
    ],

    // grow partition
    "growpart" : {
      "mode" : "auto",
      "devices" : ["/"]
    },
    "resize_rootfs" : true,

    write_files : [
      {
        "path" : "/etc/ssh/sshd_config",
        "content" : templatefile("${path.module}/templates/sshd_config", { user = var.vm.username })
      }
    ]
  }
}

data "template_cloudinit_config" "init_config" {
  count         = var.vm.vm_count
  gzip          = false
  base64_encode = false

  part {
    filename     = format("init%02d.cfg", count.index + 1)
    content_type = "text/cloud-config"
    content      = local.cloudinit_tmpl
  }
}

data "template_file" "network_config" {
  count    = var.vm.vm_count
  template = file("${path.module}/templates/network_dhcp.yaml")
  vars = {
    nic = var.vm.network_interface_name
  }
}
