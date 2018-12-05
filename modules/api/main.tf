resource "aws_api_gateway_rest_api" "main" {
  name = "${var.name}"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

// ---

resource "aws_api_gateway_resource" "enroll" {
  rest_api_id = "${aws_api_gateway_rest_api.main.id}"
  parent_id   = "${aws_api_gateway_rest_api.main.root_resource_id}"
  path_part   = "enroll"
}

module "enroll_post_method" {
  source  = "opendevsecops/apigateway-method/aws"
  version = "0.2.0"

  api_id          = "${aws_api_gateway_rest_api.main.id}"
  api_resource_id = "${aws_api_gateway_resource.enroll.id}"
  method          = "POST"
  lambda          = "${var.lambda_handler_arn}"
  authorization   = "NONE"

  request_template = <<EOF
{
  "op": "enroll",
  "params": $input.json('$')
}
EOF

  depends_on = [
    "${aws_api_gateway_rest_api.main.id}",
    "${aws_api_gateway_resource.enroll.id}",
  ]
}

// ---

resource "aws_api_gateway_resource" "killswitch" {
  rest_api_id = "${aws_api_gateway_rest_api.main.id}"
  parent_id   = "${aws_api_gateway_rest_api.main.root_resource_id}"
  path_part   = "killswitch"
}

module "killswitch_post_method" {
  source  = "opendevsecops/apigateway-method/aws"
  version = "0.2.0"

  api_id          = "${aws_api_gateway_rest_api.main.id}"
  api_resource_id = "${aws_api_gateway_resource.killswitch.id}"
  method          = "POST"
  lambda          = "${var.lambda_handler_arn}"
  authorization   = "NONE"

  request_template = <<EOF
{
  "op": "killswitch",
  "params": $input.json('$')
}
EOF

  depends_on = [
    "${aws_api_gateway_rest_api.main.id}",
    "${aws_api_gateway_resource.killswitch.id}",
  ]
}

// ---

resource "aws_api_gateway_resource" "config" {
  rest_api_id = "${aws_api_gateway_rest_api.main.id}"
  parent_id   = "${aws_api_gateway_rest_api.main.root_resource_id}"
  path_part   = "config"
}

module "config_post_method" {
  source  = "opendevsecops/apigateway-method/aws"
  version = "0.2.0"

  api_id          = "${aws_api_gateway_rest_api.main.id}"
  api_resource_id = "${aws_api_gateway_resource.config.id}"
  method          = "POST"
  lambda          = "${var.lambda_handler_arn}"
  authorization   = "NONE"

  request_template = <<EOF
{
  "op": "config",
  "params": $input.json('$')
}
EOF

  depends_on = [
    "${aws_api_gateway_rest_api.main.id}",
    "${aws_api_gateway_resource.config.id}",
  ]
}

// ---

resource "aws_api_gateway_resource" "log" {
  rest_api_id = "${aws_api_gateway_rest_api.main.id}"
  parent_id   = "${aws_api_gateway_rest_api.main.root_resource_id}"
  path_part   = "log"
}

module "log_post_method" {
  source  = "opendevsecops/apigateway-method/aws"
  version = "0.2.0"

  api_id          = "${aws_api_gateway_rest_api.main.id}"
  api_resource_id = "${aws_api_gateway_resource.log.id}"
  method          = "POST"
  lambda          = "${var.lambda_handler_arn}"
  authorization   = "NONE"

  request_template = <<EOF
{
  "op": "log",
  "params": $input.json('$')
}
EOF

  depends_on = [
    "${aws_api_gateway_rest_api.main.id}",
    "${aws_api_gateway_resource.log.id}",
  ]
}

// ---

resource "aws_api_gateway_resource" "distributed_read" {
  rest_api_id = "${aws_api_gateway_rest_api.main.id}"
  parent_id   = "${aws_api_gateway_rest_api.main.root_resource_id}"
  path_part   = "distributed_read"
}

module "distributed_read_post_method" {
  source  = "opendevsecops/apigateway-method/aws"
  version = "0.2.0"

  api_id          = "${aws_api_gateway_rest_api.main.id}"
  api_resource_id = "${aws_api_gateway_resource.distributed_read.id}"
  method          = "POST"
  lambda          = "${var.lambda_handler_arn}"
  authorization   = "NONE"

  request_template = <<EOF
{
  "op": "distributed_read",
  "params": $input.json('$')
}
EOF

  depends_on = [
    "${aws_api_gateway_rest_api.main.id}",
    "${aws_api_gateway_resource.distributed_read.id}",
  ]
}

// ---

resource "aws_api_gateway_resource" "distributed_write" {
  rest_api_id = "${aws_api_gateway_rest_api.main.id}"
  parent_id   = "${aws_api_gateway_rest_api.main.root_resource_id}"
  path_part   = "distributed_write"
}

module "distributed_write_post_method" {
  source  = "opendevsecops/apigateway-method/aws"
  version = "0.2.0"

  api_id          = "${aws_api_gateway_rest_api.main.id}"
  api_resource_id = "${aws_api_gateway_resource.distributed_write.id}"
  method          = "POST"
  lambda          = "${var.lambda_handler_arn}"
  authorization   = "NONE"

  request_template = <<EOF
{
  "op": "distributed_write",
  "params": $input.json('$')
}
EOF

  depends_on = [
    "${aws_api_gateway_rest_api.main.id}",
    "${aws_api_gateway_resource.distributed_write.id}",
  ]
}

// ---

resource "aws_api_gateway_resource" "carve_init" {
  rest_api_id = "${aws_api_gateway_rest_api.main.id}"
  parent_id   = "${aws_api_gateway_rest_api.main.root_resource_id}"
  path_part   = "carve_init"
}

module "carve_init_post_method" {
  source  = "opendevsecops/apigateway-method/aws"
  version = "0.2.0"

  api_id          = "${aws_api_gateway_rest_api.main.id}"
  api_resource_id = "${aws_api_gateway_resource.carve_init.id}"
  method          = "POST"
  lambda          = "${var.lambda_handler_arn}"
  authorization   = "NONE"

  request_template = <<EOF
{
  "op": "carve_init",
  "params": $input.json('$')
}
EOF

  depends_on = [
    "${aws_api_gateway_rest_api.main.id}",
    "${aws_api_gateway_resource.carve_init.id}",
  ]
}

// ---

resource "aws_api_gateway_resource" "carve_block" {
  rest_api_id = "${aws_api_gateway_rest_api.main.id}"
  parent_id   = "${aws_api_gateway_rest_api.main.root_resource_id}"
  path_part   = "carve_block"
}

module "carve_block_post_method" {
  source  = "opendevsecops/apigateway-method/aws"
  version = "0.2.0"

  api_id          = "${aws_api_gateway_rest_api.main.id}"
  api_resource_id = "${aws_api_gateway_resource.carve_block.id}"
  method          = "POST"
  lambda          = "${var.lambda_handler_arn}"
  authorization   = "NONE"

  request_template = <<EOF
{
  "op": "carve_block",
  "params": $input.json('$')
}
EOF

  depends_on = [
    "${aws_api_gateway_rest_api.main.id}",
    "${aws_api_gateway_resource.carve_block.id}",
  ]
}

// ---

resource "aws_api_gateway_deployment" "user_v1" {
  rest_api_id = "${aws_api_gateway_rest_api.main.id}"

  stage_name        = "v1"
  stage_description = "${md5(file("${path.module}/main.tf"))}"

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    "aws_api_gateway_rest_api.main",
    "aws_api_gateway_resource.enroll",
    "module.enroll_post_method",
    "aws_api_gateway_resource.killswitch",
    "module.killswitch_post_method",
    "aws_api_gateway_resource.config",
    "module.config_post_method",
    "aws_api_gateway_resource.log",
    "module.log_post_method",
    "aws_api_gateway_resource.distributed_read",
    "module.distributed_read_post_method",
    "aws_api_gateway_resource.distributed_write",
    "module.distributed_write_post_method",
    "aws_api_gateway_resource.carve_init",
    "module.carve_init_post_method",
    "aws_api_gateway_resource.carve_block",
    "module.carve_block_post_method",
  ]
}
