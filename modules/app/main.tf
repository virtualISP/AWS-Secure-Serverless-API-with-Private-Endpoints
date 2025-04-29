resource "aws_dynamodb_table" "main" {
  name         = "${var.project_name}-data"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_lambda_function" "main" {
  filename      = "${path.module}/../../lambda-code/lambda_function.zip"
  function_name = "${var.project_name}-handler"
  role          = aws_iam_role.lambda.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"

  timeout = 30

  vpc_config {
    subnet_ids         = [var.private_subnet_id]
    security_group_ids = [aws_security_group.lambda.id]
  }

  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.main.name
    }
  }
}

resource "aws_apigatewayv2_api" "main" {
  name          = "${var.project_name}-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "lambda" {
  api_id           = aws_apigatewayv2_api.main.id
  integration_type = "AWS_PROXY"
  integration_uri  = aws_lambda_function.main.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "post" {
  api_id    = aws_apigatewayv2_api.main.id
  route_key = "POST /items"
  target    = "integrations/${aws_apigatewayv2_integration.lambda.id}"
}

resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.main.id
  name        = "$default"
  auto_deploy = true
}

resource "aws_lambda_permission" "allow_apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.main.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.main.execution_arn}/*/*"
}
