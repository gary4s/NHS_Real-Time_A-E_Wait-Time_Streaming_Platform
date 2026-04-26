variable "subscription_id" {}
variable "tenant_id" {}
variable "client_id" {}
variable "client_secret" {
  sensitive = true
}

variable "resource_group_name" {
  default = "rg-ae-waittime-streaming"
}

variable "location" {
  default = "uksouth"
}

variable "eventhub_namespace_name" {
  default = "ehns-ae-waittime"
}

variable "eventhub_name" {
  default = "eh-ae-waittime"
}
