
output "ecr_repo_urls" {
  value       = module.ecr_backends
  description = "URLs por backend"
}

output "ecr_java_repo_url" {
  value       = module.ecr_backends.aws_ecr_repository_java
  description = "URL del repo Java"
}

output "ecr_node_repo_url" {
  value       = module.ecr_backends.aws_ecr_repository_node
  description = "URL del repo Node"
}