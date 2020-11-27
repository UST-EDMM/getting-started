variable "region" {
  default = "eu-west-1"
}
variable "ssh_user" {
  default = "ubuntu"
}
variable "os_auth_url" {
}
variable "os_project_id" {
}
variable "os_user_domain_name" {
}
variable "os_username" {
}
variable "os_password" {
}
variable "os_region_name" {
}


provider "openstack" {
  user_name        = var.os_username
  password         = var.os_password
  auth_url         = var.os_auth_url
  region           = var.os_region_name
  user_domain_name = var.os_user_domain_name
  tenant_id        = var.os_project_id
}

data "tls_public_key" "priv_key" {
  private_key_pem = file("/mnt/e/Projects/masterthesis/transformation-framework/icsoc-demo/./files/ubuntu/key.pem")
}


resource "openstack_compute_instance_v2" "ubuntu_db" {
  name        = "ubuntu_db"
  image_name  = "Ubuntu 18.04"
  flavor_name = "m1.small"
  key_pair    = "win10key"
  security_groups = [
  "default"]

  metadata = {
    this = "that"
  }

  network {
    name = "public-belwue"
  }

  provisioner "file" {
    source      = "./env.sh"
    destination = "/opt/env.sh"
    connection {
      type        = "ssh"
      user        = var.ssh_user
      host        = self.access_ip_v4
      private_key = file("/mnt/e/Projects/masterthesis/transformation-framework/icsoc-demo/./files/ubuntu/key.pem")
    }
  }


}

resource "local_file" "compute_ubuntu_db" {
  content = jsonencode({
    "hostname" = openstack_compute_instance_v2.ubuntu_db.access_ip_v4
  })
  filename = "ubuntu_db_computed_properties.json"
}
output "compute_ubuntu_db_address" {
  value = openstack_compute_instance_v2.ubuntu_db.access_ip_v4
}

