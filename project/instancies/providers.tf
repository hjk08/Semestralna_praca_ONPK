
terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
      version = "1.52.1"
    }
  }
}

provider "openstack" {
  user_name          = var.username
  password           = var.password
  tenant_name        = var.tenant_name
  auth_url           = local.kis_os_auth_url
  region             = local.kis_os_region
  insecure           = true
  endpoint_overrides = local.kis_os_endpoint_overrides
  domain_name        = local.domain_name
}

provider "source" {
  compute = "github.com/hjk08/Semstralna_praca_ONPK/modules/compute"
  network = "github.com/hjk08/Semstralna_praca_ONPK/modules/network"
}