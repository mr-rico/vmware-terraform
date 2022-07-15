## root main ##

module "vcbuild" {
   source = "./modules/vcbuild"
   }

/*
module "vcconfig" {
   source = "./modules/vcconfig"
   #depends_on = [module.vcbuild.null_resource]
   }
*/