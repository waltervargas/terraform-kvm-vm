locals {
  base_image        = "https://cdimage.debian.org/cdimage/cloud/buster/20211011-792/debian-10-generic-amd64-20211011-792.qcow2"
  ssh_key           = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDY+mw6YHcplTMHWa2j9+CCAnKeqmwJaJY1Z8nzxPUbFNIsY9FwU1e0NhjvrKRhpwinfjIGdZsuH6rg+T3glEo0tj++5RQUmuCx6LcRj68uWA2RcUhidCe+A17ojxya8FzpCQLU6orW4pNhcHWR+4QoT+wYI0Wccr4aQsPEfAUWYAAj38aK26bD99qdackpM9H/TPr88Z4/rPtKkmmzplp+Z81QmygDsy9jkvlS2vjhPSA5UhUGQzEuWsFo5pgmgq31s5TzkcFUWfvLKTeaUJ7UXcDootwNB+gixD308kF95eUeqIMxovIfyusvfDV7K1AWGP9lvaRbQ+cyTutSVYtHiziFRaURDGXxfUEoNG2+5BYs7cf4hGwOtAywytGSIuq2rcmnBpiffIZt9aiRn8OkxmiLdKNo7IGcdOmoXWx0Dfz+pcdwj4IdQ1KeRsexeBzaDavlb/Togweb6KSElBS+gHdw0gRqXrE2ex6UnaRergpVdBp0Br7vpj8jKbt/oH8JfiqyamXEUI+QQ1tPHvQA/Ox9PuCB/ONF0QDINZcnQpW8rd2QIxVA7tDOu2XCD9ZkNJgt690NJl5IMjwSSQ68Ev25/0vu85qHmFfLbmZdX3j/BoZT1/cbYtocIlBuH63Z84+47jz+LDiw5ID0VK3Ch/yRKBdOnvqDCMroHelbtw== cardno:000611879112"
  br                = "virbr0"
  network_interface = "ens3"
  username          = "walter"
  root_password     = "changeme"
}
