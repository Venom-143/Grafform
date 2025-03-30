output "grafana_dashboard_url" {
  value = module.grafana.grafana_dashboard.example_dashboard.url
  description = "The URL of the created Grafana dashboard"
}
