module "ecr" {
  source       = "./modules/ECR"
  names        = ["backend-api", "node-aws-backend"]
  keep_last    = 30
  scan_on_push = true
  immutable    = true
  tags         = { Project = "aws-terraform" }
}

output "ecr_urls" { value = module.ecr.repository_urls }
