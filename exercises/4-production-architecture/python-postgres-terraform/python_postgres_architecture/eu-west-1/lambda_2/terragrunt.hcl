terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-lambda.git?ref=v2.0.0"
}

include {
  path = find_in_parent_folders()
}

###########################################################
# View all available inputs for this module:
# https://registry.terraform.io/modules/terraform-aws-modules/lambda/aws/2.0.0?tab=inputs
###########################################################
inputs = {
  # A unique name for your Lambda Function
  # type: string
  function_name = "funny-pika"

  # Lambda Function entrypoint in your code
  # type: string
  handler = "handler.lambda_handler"

  # Amount of memory in MB your Lambda Function can use at runtime. Valid value between 128 MB to 10,240 MB (10 GB), in 64 MB increments.
  # type: number
  memory_size = 128

  # Lambda Function runtime
  # type: string
  runtime = "python3.8"

  # The absolute path to a local file or directory containing your Lambda source code
  # type: any
  source_path = jsonencode("handler.py")

  
}
