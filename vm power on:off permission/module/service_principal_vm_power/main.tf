# Create an Azure AD Application
resource "azuread_application" "this" {
  display_name = var.app_name
}

# Create Service Principal for that App
resource "azuread_service_principal" "this" {
  client_id = azuread_application.this.client_id
}

# Create Client Secret (password)
resource "azuread_application_password" "this" {
  application_id    = azuread_application.this.id
  end_date_relative = var.secret_duration # e.g., "8760h" = 1 year
}

# Existing Resource Group
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# Custom RBAC Role Definition
resource "azurerm_role_definition" "custom_vm_power" {
  name        = "${var.app_name}-vm-power-role"
  scope       = data.azurerm_resource_group.rg.id
  description = "Custom role for starting/stopping VMs only"

  permissions {
    actions = [
      "Microsoft.Compute/virtualMachines/start/action",
      "Microsoft.Compute/virtualMachines/deallocate/action"
    ]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_resource_group.rg.id
  ]
}

# Assign custom role to Service Principal
resource "azurerm_role_assignment" "assign" {
  scope              = data.azurerm_resource_group.rg.id
  role_definition_id = azurerm_role_definition.custom_vm_power.role_definition_resource_id
  principal_id       = azuread_service_principal.this.id
}
