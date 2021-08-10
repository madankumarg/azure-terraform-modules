########## Storage Account ##########
resource "azurerm_storage_account" "storageaccount" {
  for_each                 = { for t in var.storage_account : t.name => t }
  resource_group_name      = var.rg_name
  location                 = var.location
  name                     = lookup(each.value, "name")
  account_tier             = lookup(each.value, "tier")
  account_replication_type = lookup(each.value, "replication")
  allow_blob_public_access = lookup(each.value, "allow_blob_public_access")
  tags                     = var.tags
}

########## Storage Account Container ##########
resource "azurerm_storage_container" "container" {
  for_each              = { for s in local.stg : "${s.stgnames}-${s.name}" => s }
  name                  = each.value.name
  storage_account_name  = each.value.stgnames
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.storageaccount]
}

########## Storage Account FileShare ##########
resource "azurerm_storage_share" "fileshare" {
  for_each             = { for s in local.file : "${s.stgnames}-${s.name}-${s.quota}" => s }
  name                 = each.value.name
  storage_account_name = each.value.stgnames
  quota                = each.value.quota
}