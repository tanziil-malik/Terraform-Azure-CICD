terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Create Resource Group
resource "azurerm_resource_group" "cicd_rg" {
  name     = var.rg_name
  location = var.region
}

# Create App Service Plan
resource "azurerm_service_plan" "cicd_plan" {
  name                = "Terraform-AzureCICD-Plan"
  location            = azurerm_resource_group.cicd_rg.location
  resource_group_name = azurerm_resource_group.cicd_rg.name
  sku_name            = "B1"
  os_type             = "Linux"
}

# Create Web App
resource "azurerm_linux_web_app" "cicd_app" {
  name                = var.app_name
  location            = azurerm_resource_group.cicd_rg.location
  resource_group_name = azurerm_resource_group.cicd_rg.name
  service_plan_id     = azurerm_service_plan.cicd_plan.id

  site_config {
    application_stack {
      node_version = "20-lts"
    }
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }
}
