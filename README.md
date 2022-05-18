# Terraform OCI Instance

Terraform module to provision a Oracle Cloud Instances.

## Usage:

Using default address:

```hcl
module "cygnus" {
  source = "github.com/ecanuto/terraform-oci-instance"

  compartment_id = var.compartment_id

  display_name        = "my-test-instance"
  source_id           = local.ubuntu_image_id
  shape               = "VM.Standard.A1.Flex"
  shape_ocpus         = 1
  shape_memory_in_gbs = 4
  volume_size_in_gbs  = 50

  subnet_id        = oci_core_subnet.public.id
  assign_public_ip = true

  ssh_authorized_keys = file("~/.ssh/id_rsa.pub")
  user_data           = file("./cloud-init.yml")
}
```

## Requirements

terraform >= 1.1.0  
oracle/oci >= 4.75.0
