variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

# Remove the region variable if not used in app module