# 疎通確認用の API エンドポイント URL を出力する
output "api_connectivity_test_invoke_url" {
  value = "${aws_apigatewayv2_api.api_connectivity_test.api_endpoint}/${aws_apigatewayv2_stage.api_connectivity_test_prod.name}"
}
