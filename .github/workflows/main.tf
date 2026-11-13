terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# #Configure the AWS Provider
provider "aws" {
  region = "eu-north-1"
  access_key = "AKIA54D4WQB6UHJQDV4H"
  secret_key = "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"
}

terraform {
  backend "s3" {
    bucket         = "quest-dev-bucket"
    key            = "tf_statefile/terraform.tfstate"
    region         = "eu-north-1"
    access_key = "AKIA54D4WQB6UHJQDV4H"
    secret_key = "VxUKHXmAtVTKlLRlg+uGQhgG+QFWvnIWqy6ne81R"              
  }
}

#s3 creation:
resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-lami"

  tags = {
    Name        = "Lami_My_bucket"
    Environment = "Dev"
  }
}
