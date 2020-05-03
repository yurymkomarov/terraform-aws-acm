variable "name" {
  type        = string
  description = "Name that will be used in resources names and tags."
  default     = "terraform-aws-acm"
}

variable "domain_name" {
  type        = string
  description = "This is the name of the hosted zone."
}
