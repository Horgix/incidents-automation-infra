variable "project" {
  type        = "string"
  description = "Full name of the project"
}

variable "owner" {
  type        = "string"
  description = "E-mail of the owner of the resources, to be contacted if needed"
}

provider "aws" {
  region = "eu-west-1"
  version = "~> 0.1"
}

resource "aws_s3_bucket" "terraform-state-bucket" {
  bucket = "xebicon-incidents-automation-terraform-state"
  acl    = "private"

  tags {
    Project     = "${var.project}"
    Owner       = "${var.owner}"
  }

  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform-state-lock-table" {
  name           = "xebicon-incidents-automation-terraform-state-lock"
  read_capacity  = 1
  write_capacity = 1

  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    Project     = "${var.project}"
    Owner       = "${var.owner}"
  }
}
