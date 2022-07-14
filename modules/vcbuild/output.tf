output vcsa_build {
  value       = ""
  sensitive   = true
  description = "description"
  depends_on  = [null_resource.vc]
}
