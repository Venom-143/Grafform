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
  config_json = jsonencode({
    "dashboard" = {
      "id"        = null
      "title"     = "Example Dashboard"
      "tags"      = ["example"]
      "timezone"  = "browser"
      "panels"    = [
        {
          "type"    = "graph"
          "title"   = "Example Panel"
          "targets" = [
            {
              "target" = "example_metric"
            }
          ]
        }
      ]
    }
  })
}

resource "grafana_data_source" "prometheus" {
  name     = "Prometheus"proxy
  type     = "prometheus"
  access   = "direct"
  url      = var.prometheus_url
  is_default = true
}
