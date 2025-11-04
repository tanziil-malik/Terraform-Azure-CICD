output "resource_group_name" {
  description = "Name of the Resource Group"
  value       = azurerm_resource_group.cicd_rg.name
}

output "webapp_name" {
  description = "Name of the Web App"
  value       = azurerm_linux_web_app.cicd_app.name
}

output "webapp_url" {
  description = "URL of the deployed Web App"
  value       = azurerm_linux_web_app.cicd_app.default_hostname
}
