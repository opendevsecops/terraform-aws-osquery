variable "name" {
  description = "The name of the API Gateway for osquery backend"
  default     = "opendevsecops_osquery"
}

variable "lambda_handler_arn" {
  description = "The ARN of the lambda handling function"
}

# depends_on workaround

variable "depends_on" {
  description = "Helper variable to simulate depends_on for terraform modules"
  default     = []
}
