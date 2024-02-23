data "azurerm_storage_account" "aksdata" {
  name                = var.data_sa
  resource_group_name = var.data_resource_group_name
}

output "Datastorage_account_name" {
  value = data.azurerm_storage_account.aksdata.name
}



data "azurerm_storage_account" "akslogs" {
  name                = var.log_sa
  resource_group_name = var.logs_resource_group_name
}

output "Logsstorage_account_name" {
  value = data.azurerm_storage_account.akslogs.name
}

