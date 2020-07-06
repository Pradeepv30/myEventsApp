# Create Google Cloud VM | vm.tf

# Terraform plugin for creating random ids
resource "random_id" "instance_id_web" {
 byte_length = 4
}

# Create VM - Web Server
resource "google_compute_instance" "vm_instance_web" {
  name         = "${var.app_name}-web-server-${var.app_environment}-${random_id.instance_id.hex}"
  machine_type = "f1-micro"
  zone         = var.gcp_zone_1
  #hostname     = "${var.app_name}-webserver-${random_id.instance_id.hex}.${var.app_domain}"
  tags         = ["ssh","http"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  metadata_startup_script = "apt update; apt-get install git curl software-properties-common -y; curl -sL https://deb.nodesource.com/setup_13.x | sudo bash -; apt install nodejs -y; git clone https://github.com/drehnstrom/events-sample-node; cd events-sample-node/external; export PORT=80; export SERVER=http://10.10.1.10:8080; npm install; node server.js"

  network_interface {
    network       = google_compute_network.vpc.name
    subnetwork    = google_compute_subnetwork.public_subnet_1.name
    access_config { }
  }
} 