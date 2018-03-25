data "terraform_remote_state" "web-server" {
  backend = "s3"

  config {
    bucket = "terragrunt-state-demo"
    key    = "prod/web-server/terragrunt-state"
    region = "eu-west-3"
  }
}

locals {
  frontal_lb = "${data.terraform_remote_state.web-server.frontal_lb}"
}
