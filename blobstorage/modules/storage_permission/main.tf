resource "azurerm_role_assignment" "this" {
  count = var.principal_id == null ? 0 : 1  # only create if principal_id is provided
  scope                = var.scope_id
  role_definition_name = var.role_definition_name
  principal_id         = var.principal_id
}
