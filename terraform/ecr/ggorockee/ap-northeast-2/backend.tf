terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket         = "ggorockee-apnortheast2-tfstate"
    key            = "provisioning/terraform/ecr/ggorockee/ap-northeast-2/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}

