terraform {
  required_version = ">= 1.1.0"

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 4.75.0"
    }
  }
}

data "oci_identity_availability_domains" "ad" {
  compartment_id = var.compartment_id
}

resource "oci_core_instance" "instance" {
  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name
  compartment_id      = var.compartment_id

  display_name = var.display_name
  shape        = var.shape

  shape_config {
    ocpus         = var.shape_ocpus
    memory_in_gbs = var.shape_memory_in_gbs
  }

  source_details {
    boot_volume_size_in_gbs = var.volume_size_in_gbs
    source_type             = var.source_type
    source_id               = var.source_id
  }

  metadata = {
    "ssh_authorized_keys" = var.ssh_authorized_keys
    "user_data"           = (var.user_data != null) ? base64encode(var.user_data) : null
  }

  create_vnic_details {
    subnet_id        = var.subnet_id
    assign_public_ip = var.assign_public_ip

    defined_tags  = var.defined_tags
    freeform_tags = var.freeform_tags
  }

  preserve_boot_volume = var.preserve_boot_volume

  defined_tags  = var.defined_tags
  freeform_tags = var.freeform_tags

  lifecycle {
    ignore_changes = [
      state,
      metadata,
    ]
  }
}
