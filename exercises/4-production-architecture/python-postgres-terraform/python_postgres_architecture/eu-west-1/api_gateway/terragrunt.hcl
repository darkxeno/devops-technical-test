terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-apigateway-v2.git?ref=v1.0.0"
}

include {
  path = find_in_parent_folders()
}

###########################################################
# View all available inputs for this module:
# https://registry.terraform.io/modules/terraform-aws-modules/apigateway-v2/aws/1.0.0?tab=inputs
###########################################################
inputs = {
  # Whether to create API domain name resource
  # type: bool
  create_api_domain_name = false

  # The name of the API
  # type: string
  name = "API Gateway"

  # The API protocol. Valid values: HTTP, WEBSOCKET
  # type: string
  protocol_type = "HTTP"

  
}
