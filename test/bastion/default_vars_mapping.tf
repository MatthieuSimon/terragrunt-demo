data "terraform_remote_state" "network" {
  backend = "s3"

  config {
    bucket = "terragrunt-state-demo"
    key    = "test/network/terragrunt-state"
    region = "eu-west-3"
  }
}

locals {
  vpc_id            = "${data.terraform_remote_state.network.vpc_id}"
  bastion_subnet_id = "${data.terraform_remote_state.network.bastion_subnet_id}"
}
