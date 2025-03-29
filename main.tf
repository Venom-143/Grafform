provider "grafana" {
  url   = var.grafana_url          # URL of the Grafana instance (e.g., http://localhost:3000)
  auth  = var.grafana_api_key      # API key to authenticate with Grafana
}
