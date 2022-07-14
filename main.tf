## root main ##

module "vcbuild" {
   source = "./modules/vcbuild"
   }

#module "vcconfig" {
#   source = "./modules/vcconfig"
#   #vcconfig_depends_on = [module.vcbuild.vcsa_build]
#   }
