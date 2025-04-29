output "api_url" {
  description = "API Gateway endpoint URL"
  value       = module.app.api_url
}

output "dynamodb_table_name" {
  description = "DynamoDB table name"
  value       = module.app.dynamodb_table_name
}