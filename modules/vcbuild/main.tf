### vcbuild/main.tf ##

data "template_file" "task" {
  template = "${file("/home/rico/github/vmware-terraform/modules/vcbuild/vctemplate.json")}"

  vars = {
    esx_hostname = "${var.esx_hostname}"
    esx_username = "${var.esx_username}"
    esx_password = "${var.esx_password}"
    esx_network = "${var.esx_network}"
    esx_datastore = "${var.esx_datastore}"
    vc_name = "${var.vc_name}"
    vc_ip = "${var.vc_ip}"
    vc_fqdn = "${var.vc_fqdn}"
    vc_password = "${var.vc_password}"

  }
}
resource "local_file" "vc" {
    content     = "${data.template_file.task.rendered}"
    filename = "./vctemplate-modified.json"
}

resource "null_resource" "vc" {
  provisioner "local-exec" {
    command = "/home/rico/github/vmware-terraform/modules/vcbuild/VMware-VCSA-all-6.7.0-15132721/vcsa-cli-installer/lin64/vcsa-deploy install --accept-eula --acknowledge-ceip --terse --no-ssl-certificate-verification ./vctemplate-modified.json"
  }
}
