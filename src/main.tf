data "aws_region" current {}

##### Get Default VPC of the region
data "aws_vpc" "default" {
  default = true
}

data "aws_vpc" "VPCtoBeUsed" {
  id = data.aws_vpc.default.id 
}

##### Get default Subnet ID of Default VPC of the region
data "aws_subnet_ids" "FetchingSubnetIDs" {
  vpc_id = data.aws_vpc.VPCtoBeUsed.id
}

resource "aws_instance" "workshop_instance" {
  ami = data.aws_ami.ubuntu.id
  availability_zone = var.subnet_availability_zone
  instance_type = "${var.instance_type}"
  key_name = "${var.aws_key}"
  associate_public_ip_address = true
  source_dest_check = false
  subnet_id = element(tolist(data.aws_subnet_ids.FetchingSubnetIDs.ids),0) 
  root_block_device {
    volume_size = var.volume_size
  }
  tags = {
  Name= "WorkShop_1"
  }
  depends_on = [data.aws_ami.ubuntu ]
}


data.aws_ami.ubuntu {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["514960042727"]
}
