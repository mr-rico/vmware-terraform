### vcconfig/variables.tf ###

variable "vchostname" {
  description = "vcenter server"
  default = "vcsa.mydomain.lab"
}

variable "vcuser" {
  description = "vcenter user account"
  default = "administrator@vsphere.local"
}

variable "vcpassword" {
  description = "vcenter user password"
  default = "Password#123!@#"
}

variable "datacenter" {
  default = "dc"
}

variable "network_interfaces" {
  default = [
    "vmnic0",
    "vmnic1",
    "vmnic2",
    "vmnic3",
  ]
}
