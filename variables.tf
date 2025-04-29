variable "project_name" {
  description = "Project name prefix for resources"
  type        = string
  default     = "serverless-api"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "AWS availability zone"
  type        = string
  default     = "us-east-1a"
}
