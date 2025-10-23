variable "resource_group_name" {
  default = "demo-aks-rg"
}

variable "location" {
  default = "westeurope"
}

variable "cluster_name" {
  default = "demo-aks-cluster"
}

variable "node_count" {
  default = 2
}

variable "vm_size" {
  default = "Standard_B2s"
}
