output "id" {
  description = "OCID of instance"
  value       = oci_core_instance.instance.id
}

output "display_name" {
  description = "Display name of instance"
  value       = oci_core_instance.instance.display_name
}

output "private_ip" {
  description = "Private IP of instance"
  value       = oci_core_instance.instance.private_ip
}

output "public_ip" {
  description = "Public IP of instance"
  value       = oci_core_instance.instance.public_ip
}
