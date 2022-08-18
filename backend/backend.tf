terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate"
    bucket = "izaak-remote-backend"
    region = "eu-west-2"
    access_key = "AKIA2WQOG5FXY4HEWRJQ"
    secret_key = "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"
  }
}