
variable "region" {
  description = "This is the region where AWS resources will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "ami" {
  description = "this is the machine image which is region specific"
  type        = string
  default     = "ami-080e1f13689e07408"
}

variable "instance_type" {
  description = "this is the instance type needed for my ec2"
  type        = string
  default     = "t2.micro"
}

variable "name" {
  description = "name of my ec2"
  type        = string
  default     = "evans-sam"
}

variable "bucket_name" {
  description = "name of my s3 bucket"
  type        = string
  default     = "this-is-my-bucket-plz"
}

variable "tag_name" {
  description = "tag name for my s3 bucket"
  type        = string
  default     = "secured"
}

variable "env" {
  description = "tag environment name for my s3 bucket"
  type        = string
  default     = "Dev"
}

variable "team" {
  description = "tag team who will be using my s3 bucket"
  type        = string
  default     = "cyber-security"
}

variable "deletion_window" {
  description = "when the kms key is deleted, it will take 7-30 days number of days before it deletes totally"
  type        = number
  default     = 30
}

variable "table_name" {
  description = "Name of my dynamodb table"
  type        = string
  default     = "tf-state-lock-with-dynamodb"
}

variable "delete_protect" {
  description = "To protect the dynamodb from being deleted by default"
  type        = bool
  default     = true
}

variable "role_name" {
  description = "My iam role name"
  type        = string
  default     = "terraform-state-file-role"
}
