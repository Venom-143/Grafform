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
