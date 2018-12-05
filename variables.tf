variable "node_config" {
  description = "The osquery node configuration"
  default     = "{}"
}

# depends_on workaround

variable "depends_on" {
  description = "Helper variable to simulate depends_on for terraform modules"
  default     = []
}
