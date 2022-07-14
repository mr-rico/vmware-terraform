### vcbuild/variables.tf ##

variable "vcentername" {
  description = "vcenter name"
  default = "vcenter_name_here"
}

variable "vcpassword" {
  description = "vcpassword"
  default = "vc_password_here"
}

variable "esxipassword" {
  description = "esxi password"
  default = "esxi_password_here"
}

variable "vcip" {
  description = "ip address"
  default = "vc_ip_here"
}

variable "dnsserver" {
  description = "dns server"
  default = "dns_server_here"
}

variable "ipprefix" {
  description = "prefix"
  default = "24"
}

variable "gateway" {
  description = "gateway"
  default = "gwy_here"
}

variable "vchostname" {
  description = "vc hostname"
  default = "vc_fqdn"
}
