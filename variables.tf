variable "compartment_id" {
  type        = string
  description = "Compartment id where to create all resources."
}

variable "defined_tags" {
  type        = map(string)
  default     = null
  description = "Predefined and scoped to a namespace to tag the resources created using defined tags."
}

variable "freeform_tags" {
  type        = map(any)
  default     = null
  description = "Simple key-value pairs to tag the created resources using freeform OCI Free-form tags."
}

variable "display_name" {
  type        = string
  description = "A user-friendly name for the instance."
}

variable "shape" {
  type        = string
  default     = "VM.Standard.A1.Flex"
  description = "The shape of an instance."
}

variable "shape_ocpus" {
  type        = number
  default     = null
  description = "The total number of OCPUs available to the instance."
}

variable "shape_memory_in_gbs" {
  type        = number
  default     = null
  description = "The total amount of memory available to the instance, in gigabytes."
}

variable "ssh_authorized_keys" {
  type        = string
  default     = null
  description = "Provide one or more public SSH keys to be included in the ~/.ssh/authorized_keys file for the default user on the instance."
}

variable "user_data" {
  type        = string
  default     = null
  description = "Provide your own base64-encoded data to be used by Cloud-Init to run custom scripts or provide custom Cloud-Init configuration."
}

variable "source_type" {
  type        = string
  default     = "image"
  description = "The source type for the instance. Use 'image' when specifying the image OCID."
}

variable "source_id" {
  type        = string
  description = "The OCID of an image or a boot volume to use, depending on the value of 'source_type'."
}

variable "volume_size_in_gbs" {
  type        = number
  default     = null
  description = "The size of the boot volume in GBs. Minimum value is 50 GB and maximum value is 32,768 GB (32 TB)."
}

variable "subnet_id" {
  type        = string
  default     = null
  description = "The OCID of the subnet to create the VNIC in."
}

variable "assign_public_ip" {
  type        = bool
  default     = true
  description = "Whether the VNIC should be assigned a public IP address."
}

variable "preserve_boot_volume" {
  type        = bool
  default     = null
  description = "Specifies whether to delete or preserve the boot volume when terminating an instance."
}
