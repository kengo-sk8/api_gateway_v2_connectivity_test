# API Gateway v2 (HTTP API)
resource "aws_apigatewayv2_api" "api_connectivity_test" {
  name          = "${var.name_prefix}-test"
  protocol_type = "HTTP"
}

# ステージを作成する
resource "aws_apigatewayv2_stage" "api_connectivity_test_prod" {
  api_id      = aws_apigatewayv2_api.api_connectivity_test.id
  name        = "prod"
  auto_deploy = true
}

# API Gateway から外部 HTTP（httpbin）へプロキシ転送する統合を定義する
resource "aws_apigatewayv2_integration" "api_connectivity_test_httpbin" {
  api_id             = aws_apigatewayv2_api.api_connectivity_test.id
  integration_type   = "HTTP_PROXY"
  integration_method = "ANY"
  integration_uri    = "https://httpbin.org/anything"

  payload_format_version = "1.0"
  timeout_milliseconds   = 29000
}

# GET /test へのリクエストを外部 HTTP プロキシ統合へルーティングする
resource "aws_apigatewayv2_route" "api_connectivity_test_get" {
  api_id    = aws_apigatewayv2_api.api_connectivity_test.id
  route_key = "ANY /test"
  target    = "integrations/${aws_apigatewayv2_integration.api_connectivity_test_httpbin.id}"
}
