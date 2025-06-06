terraform {
  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~> 1.10.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azapi" {
}

# Variables for the new subscription
variable "subscription_display_name" {
  type    = string
  default = "Azure Subscription 2"
}

variable "billing_account_id" {
  type    = string
  description = "The resource ID of your billing account (e.g. /providers/Microsoft.Billing/billingAccounts/...)"
  default = "/providers/Microsoft.Billing/billingAccounts/Nishikant Sinha"
}
resource "azapi_resource_action" "new_subscription" {
  type        = "Microsoft.Billing/billingAccounts/subscriptions@2020-05-01"
  resource_id = var.billing_account_id
  action      = "createSubscription"
  body = jsonencode({
    displayName         = var.subscription_display_name
    skuId               = "0001"
    billingProfileId    = "Nishikant Sinha (NKMI-D7XD-BG7-PGB)"
    invoiceSectionId    = "Nishikant Sinha (CLAN-BLXV-PJA-PGB)"
    owner               = {
      objectId = "7d135329-34d1-4094-b481-7ca9b7ff073a"
    }
  })
}
