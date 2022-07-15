### vcbuild/variables.tf ##

variable "esx_hostname" {
  description = "esx host name"
  default = "esxi-1"
}

variable "esx_username" {
  description = "esx user name"
  default = "root"
}

variable "esx_password" {
  description = "esx password"
  default = "Password#1!"
}

variable "esx_network" {
  description = "esx network"
  default = "VM Network"
}

variable "esx_datastore" {
  description = "esx datastore"
  default = "datastore1"
}

variable "vc_name" {
  description = "vcsa virtual machine name"
  default = "vcsa"
}

variable "vc_ip" {
  description = "vcsa ip address"
  default = "172.16.163.100"
}

variable "vc_fqdn" {
  description = "vcsa fqdn"
  default = "vcsa.mydomain.lab"
}

variable "vc_password" {
  description = "vcsa password"
  default = "Password#123!@#"
}

