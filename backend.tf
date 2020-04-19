terraform {
  backend "remote" {
    organization = "mbell"

    workspaces {
      name = "infra"
    }
  }
}
