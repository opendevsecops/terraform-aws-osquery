module "handler" {
  source = "modules/handler"

  node_config = "${var.node_config}"
}

resource "aws_lambda_permission" "handler" {
  statement_id  = "AllowInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${module.handler.name}"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${module.api.arn}/*/*/*"
}

// ---

module "api" {
  source = "modules/api"

  lambda_handler_arn = "${module.handler.arn}"

  depends_on = ["${module.handler.arn}"]
}
