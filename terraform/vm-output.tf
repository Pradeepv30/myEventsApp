# Virtual machine output | vm-output.tf

output "backend-name" {
  value = google_compute_instance.vm_instance_backend.name
}

output "backend-external-ip" {
  value = google_compute_instance.vm_instance_backend.network_interface.0.access_config.0.nat_ip
}

output "backend-internal-ip" {
  value = google_compute_instance.vm_instance_backend.network_interface.0.network_ip
}

output "web-name" {
  value = google_compute_instance.vm_instance_web.name
}

output "web-external-ip" {
  value = google_compute_instance.vm_instance_web.network_interface.0.access_config.0.nat_ip
}

output "web-internal-ip" {
  value = google_compute_instance.vm_instance_web.network_interface.0.network_ip
}