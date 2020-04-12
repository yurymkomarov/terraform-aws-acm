variable "name" {
  type        = string
  description = "Name that will be used in resources names and tags."
  default     = "terraform-aws-ssh-bastion"
}

variable "domain_name" {
  type        = string
  description = "The name of domain."
}
