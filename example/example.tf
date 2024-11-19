locals {
  naming_convention_info = {
    project_code = "ml"
    env          = "en"
    zone         = "zn"
    tier         = "tier"
    name         = "001"
    agency_code  = "bj"
  }
  tags = {
    environment = "Production"
  }

}

module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    1 = {
      name                   = var.resource_group_name
      location               = var.location
      naming_convention_info = local.naming_convention_info
      tags = {
      }
    }
  }
}


module "azure_key_vault_access_policy" {
    source = "git::https://github.com/BrettOJ/tf-az-module-azure-key-vault-access-policy?ref=main"
    key_vault_id = var.key_vault_id
    tenant_id    = var.tenant_id
    object_id    = var.object_id
    application_id = var.application_id
    
    certificate_permissions = var.certificate_permissions
    key_permissions         = var.key_permissions
    secret_permissions      = var.secret_permissions
    storage_permissions     = var.storage_permissions
}


