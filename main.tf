terraform {

  required_providers {

    aws = {

      source  = "hashicorp/aws"

      version = "~> 4.67.0"

    }

  }

  required_version = ">= 1.2.0"

}

provider "aws" {

  region  = "us-east-1"

}

resource "aws_instance" "terraform"  {

  ami           = "ami-04b70fa74e45c3917"

  instance_type = "t2.micro"

  tags = {

    Name = "TerraformInstance"

  }

}



resource "aws_security_group" "allow_ssh" {

  name_prefix = "allow_ssh"



  ingress {

    from_port   = 22

    to_port     = 22

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }



  egress {

    from_port   = 0

    to_port     = 0

    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

}

