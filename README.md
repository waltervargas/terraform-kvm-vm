## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_libvirt"></a> [libvirt](#requirement\_libvirt) | >=0.6.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_libvirt"></a> [libvirt](#provider\_libvirt) | >=0.6.3 |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [libvirt_cloudinit_disk.cloudinit](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/cloudinit_disk) | resource |
| [libvirt_domain.vm](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/domain) | resource |
| [libvirt_volume.base_volume](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/volume) | resource |
| [libvirt_volume.root_volume](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/volume) | resource |
| [template_cloudinit_config.init_config](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/cloudinit_config) | data source |
| [template_file.init_config](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.network_config](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vm"></a> [vm](#input\_vm) | VM Spec, look at default values for documentation | <pre>object({<br>    autostart              = bool<br>    base_volume_image_url  = string<br>    bridge_interface_name  = string<br>    count                  = string<br>    name_prefix            = string<br>    hostname               = string<br>    memory                 = string<br>    network_interface_name = string<br>    root_passwd            = string<br>    root_volume_size       = string<br>    ssh_key                = string<br>    storage_pool_name      = string<br>    time_zone              = string<br>    username               = string<br>    vcpu                   = string<br>  })</pre> | <pre>{<br>  "autostart": true,<br>  "base_volume_image_url": "https://cdimage.debian.org/cdimage/cloud/sid/daily/20210425-618/debian-sid-generic-amd64-daily-20210425-618.qcow2",<br>  "bridge_interface_name": "virbr0",<br>  "count": 1,<br>  "hostname": "localhost",<br>  "memory": 1024,<br>  "name_prefix": "kvm",<br>  "network_interface_name": "ens3",<br>  "root_passwd": "",<br>  "root_volume_size": 10,<br>  "ssh_key": "",<br>  "storage_pool_name": "default",<br>  "time_zone": "Europe/Berlin",<br>  "username": "debian",<br>  "vcpu": 1<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ips"></a> [ips](#output\_ips) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
