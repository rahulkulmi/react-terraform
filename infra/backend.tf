terraform {
  backend "s3" {
    bucket         = "newput-dev.terraform"
    key            = "newput.react-terraform-ui.dev.tfstate"
    dynamodb_table = "newput-dev.terraform"
    region         = "us-west-2"
  }
}
