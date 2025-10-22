variable "region" {
  type        = string
  description = "Region of the project"
  default     = "us-east-2"
}

variable "name-ecr-node" {
  type        = string
  description = "Name ECR to create NodeJS Backend"
  default     = "node-aws-backend"
}

variable "name-ecr-java" {
  type        = string
  description = "Name ECT to create Java Backend"
  default     = "java-aws-backend"
}

variable "name-ecr-python" {
  type        = string
  description = "Name ECT to create Python Backend"
  default     = "python-aws-backend"
}

variable "kms_key_arn" {
  type        = string
  description = "ARN de la KMS para ECR (vacío = AES256)"
  default     = ""
  nullable    = true
}

variable "scan_on_push" {
  description = "Escanear imágenes al hacer push"
  type        = bool
  default     = true
}

variable "immutable" {
  description = "Inmutabilidad de tags (IMMUTABLE vs MUTABLE)"
  type        = bool
  default     = true
}

variable "keep_last" {
  description = "Cuántas imágenes conservar por repo"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags a aplicar a los repos"
  type        = map(string)
  default     = {}
}

variable "ecr_force_delete" {
  type    = bool
  default = true
}
