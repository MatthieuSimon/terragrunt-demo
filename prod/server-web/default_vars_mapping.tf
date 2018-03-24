data "terraform_remote_state" "network" {
  backend = "s3"

  config {
    bucket = "terragrunt-state-demo"
    key    = "prod/network/terragrunt-state"
    region = "eu-west-3"
  }
}

data "terraform_remote_state" "bastion" {
  backend = "s3"

  config {
    bucket = "terragrunt-state-demo"
    key    = "prod/bastion/terragrunt-state"
    region = "eu-west-3"
  }
}

locals {
  vpc_id           = "${data.terraform_remote_state.network.vpc_id}"
  server_subnet_id = "${data.terraform_remote_state.network.server_subnet_id}"
  bastion_sg_id    = "${data.terraform_remote_state.bastion.bastion_sg_id}"
}
