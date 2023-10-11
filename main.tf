locals {
  all_regions = {
    "westus" = {
      short_name = "westus"
      long_name  = "West US"
      geo        = "us"
    },
    "eastus" = {
      short_name = "eastus"
      long_name  = "East US"
      geo        = "us"
    }
  }
}

data "azurerm_client_config" "current" {
}

data "azapi_resource_action" "regions" {
  type                   = "Microsoft.Resources/subscriptions@2023-07-01"
  resource_id            = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  action                 = "providers/${var.resource_provider}"
  method                 = "GET"
  response_export_values = ["*"]
}