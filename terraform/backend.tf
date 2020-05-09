terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "mbell"

    workspaces {
      name = "infra"
    }
  }
}
