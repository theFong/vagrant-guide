data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "sg" {
  name   = var.name
  vpc_id = data.aws_vpc.default.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
}

locals {
  key_path = "keys"
}

module "key_pair" {
  source                = "cloudposse/key-pair/aws"
  name                  = var.name
  version               = "0.18.0"
  attributes            = ["ssh", "key"]
  generate_ssh_key      = true
  ssh_public_key_path   = "../${local.key_path}"
  private_key_extension = ".pem"
  public_key_extension  = ".pub"
}

data "aws_ami" "ubuntu" {
  owners      = ["099720109477"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/*20.04-amd64*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "local_file" "vagrantfile" {
  content = templatefile("../templates/Vagrantfile.tpl", {
    key_pair_name    = module.key_pair.key_name
    private_key_path = "${local.key_path}/${basename(module.key_pair.private_key_filename)}"
    ami              = data.aws_ami.ubuntu.id // amazon ubuntu 20.04 lts
    security_group   = aws_security_group.sg.name
    profile          = var.aws_profile
  })
  filename = "../Vagrantfile"
}
