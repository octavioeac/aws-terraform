terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }

  # Opcional: backend remoto (recomendado). Si aún no lo tienes, quita este bloque
  backend "s3" {
    bucket         = "octavio-tf-state-160027200171-us-east-2"  # <-- tu bucket de estado
    key            = "envs/dev/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "octavio-tf-locks"                         # <-- tu tabla de locks
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}

# Útiles para outputs
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
