module "sandbox" {
  # Single Environment - create new accounts in variables.tf
  # AND BE CAREFUL
  for_each = var.accounts
  source   = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountName               = each.key
    AccountEmail              = each.value.email
    ManagedOrganizationalUnit = each.value.managed_ou
    SSOUserEmail              = each.value.sso_email
    SSOUserFirstName          = each.value.first_name
    SSOUserLastName           = each.value.last_name
  }

  account_customizations_name = each.key
  account_tags                = each.value.tags
  custom_fields               = each.value.custom_fields
  change_management_parameters = {
    change_requested_by = var.requested_by
    change_reason       = each.value.change_reason
  }
}
