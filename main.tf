resource "google_compute_instance_group" "instance_group" {
  project     = var.project_id
  name        = var.name
  description = var.description
  zone        = var.zone
  instances   = var.instances
  network     = var.network
  dynamic "named_port" {
    for_each = var.enable_named_port ? [{}] : []
    content {
      name = var.name
      port = var.port
    }
  }
}