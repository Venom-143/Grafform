terraform {
  required_providers {
    grafana = {
      source = "grafana/grafana"
      version = "~> 2.0"  # Optional: specify the version you want
    }
  }
}

provider "grafana" {
  url   = var.grafana_url          # URL of the Grafana instance (e.g., http://localhost:3000)
  auth  = var.grafana_api_key      # API key to authenticate with Grafana
}

resource "grafana_dashboard" "example_dashboard" {
  config_json = jsonencode(
    resource "grafana_dashboard" "test" {
      folder = grafana_folder.test.uid
      config_json = jsonencode({
        "title" : "My Dashboard",
        "uid" : "my-dashboard-uid"
      })
    }
)
}

