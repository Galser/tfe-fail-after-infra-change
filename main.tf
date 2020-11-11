terraform { 
  required_providers { 
    tfe = "~> 0.15.0" 
    } 
  }

resource "tfe_workspace" "main" {
  name         = var.workspace_name
  organization = var.organization_name
  queue_all_runs     = false
}
