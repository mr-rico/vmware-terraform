### vcbuild/main.tf ##

data "template_file" "task" {
  template = "${file("/home/rico/github/vmware-terraform/modules/vcbuild/vctemplate.json")}"

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
    command = "/home/rico/github/vmware-terraform/modules/vcbuild/VMware-VCSA-all-6.7.0-15132721/vcsa-cli-installer/lin64/vcsa-deploy install --accept-eula --acknowledge-ceip --terse --no-ssl-certificate-verification ./vctemplate.json"
  }
}
