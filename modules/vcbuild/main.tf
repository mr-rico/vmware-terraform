### vcbuild/main.tf ##

/*
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

resource "local_file" "vcsa_json" {
    content  = "${data.template_file.task.rendered}"
    filename = "./vctemplate-modified.json"
}
*/

resource "local_file" "vcsa_json" {
    content  = templatefile (
      var.template_file_path,
      {
        esx_hostname = var.esx_hostname,
        esx_username = var.esx_username,
        esx_password = var.esx_password,
        esx_network = var.esx_network,
        esx_datastore = var.esx_datastore,
        vc_name = var.vc_name,
        vc_ip = var.vc_ip,
        vc_fqdn = var.vc_fqdn,
        vc_password = var.vc_password        
      }
      )
    filename = var.modified_template_file_path
}

resource "null_resource" "vcsa_deploy" {
  provisioner "local-exec" {
    command = "${var.installcmd_file_path}/vcsa-deploy install --accept-eula --acknowledge-ceip --terse --no-ssl-certificate-verification ${var.modified_template_file_path}"
  }
}
