terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "linuxserver" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  tags = {
    Name = "poc-github-actions"
  }
}
