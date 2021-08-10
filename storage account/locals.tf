locals {
  ######## Storage Account ########
  stg = flatten([
    for stgnames in var.storage_account : [
      for name in var.container : {
        stgnames = stgnames.name
        name     = name
      }
    ]
  ])
  file = flatten([
    for stgnames in var.storage_account : [
      for name in var.fileshare : {
        stgnames = stgnames.name
        name     = name.name
        quota    = name.quota
      }
    ]
  ])
}