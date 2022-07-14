### vcconfig/terraform.tfvars ###

vchostname = "esxi-1"#"vcsa.mydomain.lab"

vcuser = "administrator@vsphere.local"

vcpassword = "Password#123!@#"

datacenter = "dc"

network_interfaces = [
    "vmnic0",
    "vmnic1",
    "vmnic2",
    "vmnic3",
  ]