variable "rg_name" {
  type = string
}
variable "location" {
  type = string
}
variable "tags" {
  type = map(any)
}
########## Storage Account ##########
variable "storage_account" {
  type = list(any)
}
variable "container" {
  type = list(string)
}
variable "fileshare" {
  type = list(any)
}

