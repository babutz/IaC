terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }

  backend "s3" {}
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

resource "yandex_vpc_subnet" "net" {
  name           = var.network_name
  zone           = var.network_zone
  network_id     = var.network_id
  v4_cidr_blocks = var.cidr_blocks
}

resource "yandex_compute_instance" "vm" {
  count = 2
  name  = "ansible-babentsov-${count.index}"
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.net.id
    nat       = true
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}