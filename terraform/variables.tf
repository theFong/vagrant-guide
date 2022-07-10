variable "name" {
  type        = string
  default     = "vagrant-guide"
  description = "Name"
}

variable "aws_profile" {
  type        = string
  default     = "default"
  description = "the local aws auth profile to use"
}
