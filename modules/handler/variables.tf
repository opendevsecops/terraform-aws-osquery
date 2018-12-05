variable "name" {
  description = "A unique name for the API (Lambda Function)"
  default     = "opendevsecops_osquery_api"
}

variable "role_name" {
  description = "A unique name for the API (Lambda Function) Role"
  default     = "opendevsecops_osquery_api"
}

variable "node_config" {
  description = "The osquery node configuration"
  default     = "{}"
}

# depends_on workaround

variable "depends_on" {
  description = "Helper variable to simulate depends_on for terraform modules"
  default     = []
}
