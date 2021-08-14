variable "location" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "vnet" {
  type = list(any)
}
variable "subnet" {
  type = list(any)
}
