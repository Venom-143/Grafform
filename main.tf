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

resource "grafana_dashboard" "sushant" {
  config_json = jsonencode({
    "dashboard" = {
      "id"        = null
      "title"     = "giterra Dashboard"
      "tags"      = ["giii"]
      "timezone"  = "browser"
      "panels"    = [
        {
          "type"    = "graph"
          "title"   = "go pnel"
          "targets" = [
            {
              "target" = "go_info"
            }
          ]
        }
      ]
    }
  })
}

