terragrunt = {
  # Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
  # working directory, into a temporary folder, and execute your Terraform commands in that folder.
  terraform {
    source = "git::https://github.com/MatthieuSimon/terragrunt-module-demo//cloudwatch"
  }

  dependencies {
    paths = ["../server-web"]
  }

  # Configure Terragrunt to automatically store tfstate files in S3
  remote_state {
    backend = "s3"

    config {
      encrypt = true
      bucket  = "terragrunt-state-demo"
      key     = "prod/cloudwatch/terragrunt-state"
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

# Overriden vars
frontal_lb = ""
