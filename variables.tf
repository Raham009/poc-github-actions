variable "ami_id" {
  description = "Ami ID"
  type        = string
  default     = "ami-00874d747dde814fa"
}

variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}
