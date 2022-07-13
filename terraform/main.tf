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

// amazon ubuntu 20.04 lts
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

locals {
  private_key_path = "${local.key_path}/${basename(module.key_pair.private_key_filename)}"
  ami              = var.ami == "" ? data.aws_ami.ubuntu.id : var.ami
}

resource "local_file" "vagrantfile" {
  count = var.generate_vagrantfile ? 1 : 0
  content = templatefile("templates/Vagrantfile.tpl", {
    key_pair_name    = module.key_pair.key_name
    private_key_path = local.private_key_path
    ami              = local.ami
    instance_type    = var.instance_type
    security_group   = aws_security_group.sg.name
    profile          = var.aws_profile
    ssh_username     = var.ssh_username
  })
  filename = "../Vagrantfile"
}
