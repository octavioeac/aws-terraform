
resource "aws_ecr_repository" "aws_ecr_repository_java" {
  name         = var.name-ecr-java
  force_delete = var.ecr_force_delete
}

resource "aws_ecr_repository" "aws_ecr_repository_node" {
  name         = var.name-ecr-node
  force_delete = var.ecr_force_delete
}