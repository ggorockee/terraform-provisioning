variable "aws_region" {
  type    = string
  default = "ap-northeast-2"
}

variable "assume_role_arn" {
  description = "The role to assume when accessing the AWS API."
  default     = "arn:aws:iam::329599650491:role/assume-id-admin"
}

# Atlantis user
variable "atlantis_user" {
  description = "The username that will be triggering atlantis commands. This will be used to name the session when assuming a role. More information - https://github.com/runatlantis/atlantis#assume-role-session-names"
  default     = "atlantis_user"
}

# Account IDs
# Add all account ID to here 
variable "account_id" {
  type = object({
    id = string
  })
  default = {
    id        = "329599650491"
    art-id    = "816736805842"
    datadog   = "464622532012"
    sumologic = "926226587429"
  }
}

# Remote State that will be used when creating other resources
# You can add any resource here, if you want to refer from others
variable "remote_state" {
  default = {
    vpc = {
      tmcd_apnortheast2 = {
        bucket = "zerone-id-apnortheast2-tfstate"
        key    = "provisioning/terraform/vpc/tmcd_apnortheast2/terraform.tfstate"
        region = "ap-northeast-2"
      }
    }
    iam = {
      zerone-id = {
        bucket = "zerone-id-apnortheast2-tfstate"
        key    = "provisioning/terraform/iam/zerone-id/terraform.tfstate"
        region = "ap-northeast-2"
      }
    }

    kms = {
      zerone-id = {
        apne2 = {
          bucket = "zerone-id-apnortheast2-tfstate"
          key    = "provisioning/terraform/kms/zerone-id/ap-northeast-2/terraform.tfstate"
          region = "ap-northeast-2"
        }
      }
    }

    ecs = {
      nginx = {
        tmcdapne2 = {
          bucket = "zerone-id-apnortheast2-tfstate"
          key    = "provisioning/terraform/ecs/nginx/tmcd_apnortheast2/terraform.tfstate"
          region = "ap-northeast-2"
        }
      }
      demo = {
        tmcdapne2 = {
          bucket = "zerone-id-apnortheast2-tfstate"
          key    = "provisioning/terraform/ecs/demo/tmcd_apnortheast2/terraform.tfstate"
          region = "ap-northeast-2"
        }
      }
    }

    security_group = {
      zerone-id = {
        tmcdapne2 = {
          bucket = "zerone-id-apnortheast2-tfstate"
          key    = "provisioning/terraform/securitygroup/zerone-id/tmcd_apnortheast2/terraform.tfstate"
          region = "ap-northeast-2"
        }
      }
    }

    codedeploy = {
      zerone-id = {
        apne2 = {
          bucket = "zerone-id-apnortheast2-tfstate"
          key    = "provisioning/terraform/codedeploy/ap-northeast-2/terraform.tfstate"
          region = "ap-northeast-2"
        }
      }
    }

    secretsmanager = {
      zerone-id = {
        apne2 = {
          bucket = "zerone-id-apnortheast2-tfstate"
          key    = "provisioning/terraform/secretsmanager/zerone-id/ap-northeast-2/terraform.tfstate"
          region = "ap-northeast-2"
        }
      }
    }

    eks = {
      tmcdapne2-nhwy = {
        bucket = "zerone-id-apnortheast2-tfstate"
        key    = "provisioning/terraform/eks/tmcd_apnortheast2/tmcdapne2-nhwy/terraform.tfstate"
        region = "ap-northeast-2"
      }
    }

    s3 = {
      zerone-id = {
        bucket = "zerone-id-apnortheast2-tfstate"
        key    = "provisioning/terraform/s3/zerone-id/terraform.tfstate"
        region = "ap-northeast-2"
      }
    }
  }
}
