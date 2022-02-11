/* 
  specific environment config (per terraform workspace)
  please be aware that specific environment config are not recommended
  should only be considered when mayor causes justify them (billing, dependencies, ...)
*/
locals {
   app_name = "devops-test"
   additional_tags = {
       author: "Constantino F. T.",
       IaC: "true",
       ManagedBy: "terraform",
   } 
   env = {
      default = {
        resource_group = {
          name = "UNDEFINED"
          location = "NONE"
        }
      }
      dev = {
        resource_group = {
          name = "MY-RESOURCE_GROUP"
          location = "northeurope"
        }          
      }
      prod = {
      }
   }
   environment = contains(keys(local.env), terraform.workspace) ? terraform.workspace : "default"
   // override default with the environment name (worspace name)
   workspace       = "${merge(local.env["default"], local.env[local.environment])}"
}

module "azure-vm" {
  source = "./modules/azure-vm"

  resource_group = local.workspace.resource_group
  app_name = local.app_name
  environment_name = local.environment

  ssh_public_key = file(coalesce(var.ssh_public_key_filepath, "${path.module}/rsa_key.pub"))

  admin_username = var.vm_admin_username

  additional_tags = local.additional_tags
}

module "azure-postgress" {
  source = "./modules/azure-postgres"

  resource_group = local.workspace.resource_group
  app_name = local.app_name
  environment_name = local.environment  

  admin_username = var.db_admin_username
  admin_password = var.db_admin_password

  additional_tags = local.additional_tags
}