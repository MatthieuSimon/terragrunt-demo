terragrunt = {
  # Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
  # working directory, into a temporary folder, and execute your Terraform commands in that folder.
  terraform {
    source = "git::https://github.com/MatthieuSimon/terragrunt-module-demo//bastion"
  }

  dependencies {
    paths = ["../network"]
  }

  # Configure Terragrunt to automatically store tfstate files in S3
  remote_state {
    backend = "s3"

    config {
      encrypt = true
      bucket  = "terragrunt-state-demo"
      key     = "test/bastion/terragrunt-state"
      region  = "eu-west-3"
    }
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# MODULE PARAMETERS
# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
# ---------------------------------------------------------------------------------------------------------------------
bastion_key = "demo-key"

# Overriden vars
vpc_id = ""

bastion_subnet_id = ""
