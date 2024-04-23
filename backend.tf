terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "ms-personal"
    workspaces {
      name = "tf-eks-nlb"
    }
  }
}