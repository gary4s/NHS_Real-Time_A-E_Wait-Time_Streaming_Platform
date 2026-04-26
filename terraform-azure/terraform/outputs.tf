output "storage_account_name" {
  value = azurerm_storage_account.datalake.name
}

output "eventhub_connection_string" {
  value     = azurerm_eventhub_authorization_rule.eh_send_listen.primary_connection_string
  sensitive = true
}
