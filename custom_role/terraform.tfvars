subscription_id     = "eb2887d7-d11e-492d-88cb-7b4f39e868a8"
resource_group_name = "mmfsl-automation"
resource_id         = ""  # Leave empty to use resource group scope, or set full resource ID

role_name    = "custom_role_storage_account"
description  = "Custom role created with Terraform"

actions = [
  "Microsoft.Storage/storageAccounts/read"
]

not_actions = [
  "Microsoft.Storage/storageAccounts/delete"
]

data_actions     = []
not_data_actions = []
