
resource "aws_ecr_repository" "aws_ecr_repository_java" {
  name = var.name-ecr-java

}


resource "aws_ecr_repository" "aws_ecr_repository_node" {
  name = var.name-ecr-node
}