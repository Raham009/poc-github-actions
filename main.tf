terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
#
#  backend "remote" {
#    organization = "your-organisation-name-here"
#
#    workspaces {
#      name = "your-terraform-workspaces-name-here
#    }
#  }
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
resource "aws_ebs_volume" "linuxvolume" {
  availability_zone = "us-east-1a"
  size              = 30
  tags = {
    Name = "LinuxVolume"
  }
}
