resource "local_file" "config" {
  filename = "${path.module}/src/config.json"
  content  = "${var.node_config}"
}

data "local_file" "config" {
  filename = "${path.module}/src/config.json"

  depends_on = ["local_file.config"]
}

module "lambda" {
  source  = "opendevsecops/lambda/aws"
  version = "0.3.0"

  source_dir  = "${path.module}/src"
  output_path = "${path.module}/build/lambda.zip"

  name      = "${var.name}"
  role_name = "${var.role_name}"

  timeout               = 900
  log_retention_in_days = 90

  environment {
    TRIGGER = "${md5("${path.module}/src/config.json")}"
  }

  depends_on = ["${data.local_file.config.content}"]
}
