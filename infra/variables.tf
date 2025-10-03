variable "region"        { 
    type = string 
    default = "us-east-2" 
    }

# ECR
variable "ecr_repo_names" { 
    type = list(string)
    default = ["backend-api"] 
    }
variable "keep_last"      { 
    type = number
    default = 30 
    }
variable "scan_on_push"   { 
    type = bool
    default = true 
    }
variable "immutable"      { 
    type = bool
    default = true 
    }
variable "kms_key_arn"    { 
    type = string
    default = "" 
    }

variable "tags" {
  type    = map(string)
  default = { 
    Project = "aws-terraform", 
    Environment = "dev" 
    }
}
