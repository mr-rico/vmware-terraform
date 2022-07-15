provider "vsphere" {
  vsphere_server = "${var.vchostname}"
  user           = "${var.vcuser}"
  password       = "${var.vcpassword}"
   # If you have a self-signed cert
  allow_unverified_ssl = true
}