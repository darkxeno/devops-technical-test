variable "resource_group" {
  type = object({
    # Declare an object using only the subset of attributes the module
    # needs. Terraform will allow any object that has at least these
    # attributes.
    name     = string
    location = string
  })
}

variable "app_name" {
  type = string
}

variable "environment_name" {
  type = string
}

variable "admin_username" {
  type = string
  sensitive = true
}

variable "admin_password" {
  type = string
  sensitive = true
}

variable "module_depends_on" {
  # the value doesn't matter; we're just using this variable
  # to propagate dependencies.
  type    = any
  default = []
}

variable "additional_tags" {
  default     = {}
  description = "Additional resource tags"
  type        = map(string)
}
