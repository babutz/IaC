terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

data "yandex_vpc_subnet" "default_ru_central1_a" {
  subnet_id = var.subnet_id
}

resource "yandex_compute_instance" "vm" {
  count = 1
  name  = "exp-${count.index}"
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
    subnet_id = data.yandex_vpc_subnet.default_ru_central1_a.id
    nat       = true
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}







