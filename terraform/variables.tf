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

variable "region" {
  type        = string
  description = "the region that this profile defautls to"
}

variable "ami" {
  type        = string
  default     = ""
  description = "ami, if this is not provided we find a ubunut 20.04 lts ami to use"
}

variable "ssh_username" {
  type        = string
  default     = "ubuntu"
  description = "username to use when sshing into instance"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "ec2 instance type"
}
