
variable "env" {
  type        = string
  description = "The name of the environment (prod, test, etc.)."
}


variable "budget_limit" {
  type        = number
  description = "Budget limit in USD"
}

