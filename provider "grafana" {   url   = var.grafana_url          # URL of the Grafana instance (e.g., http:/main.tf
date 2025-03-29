provider "grafana" {
  url   = var.grafana_url          # URL of the Grafana instance (e.g., http://localhost:3000)
  auth  = var.grafana_api_key      # API key to authenticate with Grafana
}

# Example: Creating a Grafana Dashboard
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

# Example: Creating a Grafana Datasource (e.g., Prometheus)
resource "grafana_data_source" "prometheus" {
  name     = "Prometheus"
  type     = "prometheus"
  access   = "proxy"
  url      = var.prometheus_url
  is_default = true
}
