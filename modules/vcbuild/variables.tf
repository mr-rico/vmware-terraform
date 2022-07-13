### vcbuild/variables.tf ##

variable "vcentername" {
  description = "vcenter name"
  default = "myvcenter"
}

variable "vcpassword" {
  description = "vcpassword"
  default = "Password#123!@#"
}

variable "esxipassword" {
  description = "esxi password"
  default = "Pa55w0rd999!"
}

variable "vcip" {
  description = "ip address"
  default = "192.168.1.100"
}

variable "dnsserver" {
  description = "dns server"
  default = "192.168.1.101"
}

variable "ipprefix" {
  description = "prefix"
  default = "24"
}

variable "gateway" {
  description = "gateway"
  default = "192.168.1.1"
}

variable "vchostname" {
  description = "vc hostname"
  default = "mycenter.mydomain.lab"
}
