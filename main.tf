terraform {
  cloud {
    organization = "cantthinkofanameyet"

    workspaces {
      name = "project-b"
    }
  }
}

data "terraform_remote_state" "project_a" {
  backend = "remote"

  config = {
    organization = "cantthinkofanameyet"
    workspaces = {
      name = "project-a"
    }
  }
}

output "from_project_a" {
  value = data.terraform_remote_state.project_a.outputs.pet_name
}

