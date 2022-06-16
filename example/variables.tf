variable "vm" {
  type        = any
  description = "VM Spec"
}

/*

Make sure the network_id you are providing via this variable provides Internet
connectivity, otherwise, the machine will never be able to install packages required.

The following error could happen if the machine is not able to install the
package `qemu-guest-agent`

╷
│ Error: couldn't retrieve IP address of domain id: 450d26f1-96c3-4a8d-a8dc-46d1f7e1a57c. Please check following:
│ 1) is the domain running proplerly?
│ 2) has the network interface an IP address?
│ 3) Networking issues on your libvirt setup?
│  4) is DHCP enabled on this Domain's network?
│ 5) if you use bridge network, the domain should have the pkg qemu-agent installed
│ IMPORTANT: This error is not a terraform libvirt-provider error, but an error caused by your KVM/libvirt infrastructure configuration/setup
│  timeout while waiting for state to become 'all-addresses-obtained' (last state: 'waiting-addresses', timeout: 5m0s)
│
│   with module.vm_example.libvirt_domain.vm[0],
│   on ../main.tf line 1, in resource "libvirt_domain" "vm":
│    1: resource "libvirt_domain" "vm" {
│

*/

variable "network_id" {
  description = "The corresponding network id that vms will use"
  type        = string
  default     = ""
}
