variable "region" {
  default = "us-east-1"
}

variable "aws_profile" {
  default = "nasunipmaccount"
}

variable "volume_size" {
  description = "volume_size default is set as 32GiB"
  default=32
}

variable "instance_type" {
  description = "type of instances to provision"
  default="t2.micro"
}
variable "subnet_availability_zone" {
  default=""
}
variable "aws_key" {
  default="workshop-nv"
}
