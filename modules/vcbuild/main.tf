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

data "template_file" "task" {
  template = "${file("/home/rico/vmware/modules/vcbuild/vctemplate.json")}"

  vars = {
    vcname = "${var.vcentername}"
    esxipassword = "${var.esxipassword}"
    vcpassword = "${var.vcpassword}"
    vchostname = "${var.vchostname}"
    ipaddress = "${var.vcip}"
    dnsserver = "${var.dnsserver}"
    ipprefix = "${var.ipprefix}"
    gateway = "${var.gateway}"
  }
}
resource "local_file" "foo" {
    content     = "${data.template_file.task.rendered}"
    filename = "./vctemplate.json"
}

resource "null_resource" "vc" {
  provisioner "local-exec" {
    command = "/home/rico/vmware/modules/vcbuild/VMware-VCSA-all-6.7.0-15132721/vcsa-cli-installer/lin64/vcsa-deploy install --accept-eula --acknowledge-ceip --terse --no-ssl-certificate-verification ./vctemplate.json"
  }
}
