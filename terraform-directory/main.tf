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
  default = "/providers/Microsoft.Billing/billingAccounts/55167655-ab0a-550f-83e2-5acff7ccb429:400fc766-8785-4934-b6c4-b6199ee8845a_2019-05-31"
}
resource "azapi_resource_action" "new_subscription" {
  type        = "Microsoft.Billing/billingAccounts@2020-05-01"
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
