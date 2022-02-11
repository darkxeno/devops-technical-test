
variable "vm_admin_username" {
  type = string
  default = "vmAdmin"
}

variable "db_admin_username" {
  type = string
  default = "postgressAdmin"
}

variable "db_admin_password" {
  type = string
  sensitive = true
}

variable "ssh_public_key_filepath" {
  type = string 
}