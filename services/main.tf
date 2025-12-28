# S3(tfvars_management)
module "s3" {
  source = "../modules/s3"

  name_prefix = local.name_prefix
}

# API Gateway
module "api_gateway" {
  source = "../modules/api_gateway"

  name_prefix = local.name_prefix
}
