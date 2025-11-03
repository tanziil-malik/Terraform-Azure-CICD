variable "region" {
  description = "Azure region for deployment"
  default     = "Canada Central"
}

variable "app_name" {
  description = "Name of the Web App"
  default     = "terraform-azure-cicd-demo"
}

variable "rg_name" {
  description = "Resource Group name"
  default     = "Terraform-Azure-CICD-RG"
}
