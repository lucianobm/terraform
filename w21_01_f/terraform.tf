terraform {
  backend "s3" {
    bucket         = "terraform-8534674"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform"
  }
}