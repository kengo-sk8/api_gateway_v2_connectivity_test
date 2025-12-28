terraform {
  backend "s3" {
    bucket       = "tfstate-api-gateway-v2"
    region       = "ap-northeast-1"
    key          = "terraform"
    use_lockfile = true
  }
}
