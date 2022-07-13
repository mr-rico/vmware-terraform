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

provider "vsphere" {
  vsphere_server = "${var.vchostname}"
  user           = "${var.vcuser}"
  password       = "${var.vcpassword}"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

resource "vsphere_datacenter" "dc" {
  name       = "${var.datacenter}"
}

data "vsphere_datacenter" "dc" {
  name = "${var.datacenter}"
  depends_on = [vsphere_datacenter.dc]
}

resource "vsphere_compute_cluster" "compute_cluster" {
  name            = "Compute"
  datacenter_id   = "${data.vsphere_datacenter.dc.id}"
  drs_enabled          = true
  drs_automation_level = "fullyAutomated"
  ha_enabled = true
}

resource "vsphere_compute_cluster" "management_cluster" {
  name            = "Management"
  datacenter_id   = "${data.vsphere_datacenter.dc.id}"
  drs_enabled          = true
  drs_automation_level = "fullyAutomated"
  ha_enabled = true
}

resource "vsphere_folder" "infrafolder" {
  path          = "Infrastructure"
  type          = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_folder" "templatesfolder" {
  path          = "Templates"
  type          = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_distributed_virtual_switch" "dvs" {
  name          = "mydatacenter-dvs"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"

  uplinks         = ["uplink1", "uplink2", "uplink3", "uplink4"]
  active_uplinks  = ["uplink1", "uplink2"]
  standby_uplinks = ["uplink3", "uplink4"]
  }
