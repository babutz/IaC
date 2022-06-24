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
resource "yandex_mdb_postgresql_cluster" "snp" {
  name        = "babentsov-singlenode"
  environment = "PRESTABLE"
  network_id  = yandex_vpc_network.snp.id
  config {
    version = 12
    resources {
      resource_preset_id = "b2.nano"
      disk_type_id       = "network-ssd"
      disk_size          = 16
    }
    postgresql_config = {
      max_connections                   = 100
      enable_parallel_hash              = true
      vacuum_cleanup_index_scale_factor = 0.2
      autovacuum_vacuum_scale_factor    = 0.34
      default_transaction_isolation     = "TRANSACTION_ISOLATION_READ_COMMITTED"
      shared_preload_libraries          = "SHARED_PRELOAD_LIBRARIES_AUTO_EXPLAIN,SHARED_PRELOAD_LIBRARIES_PG_HINT_PLAN"
    }
  }
  maintenance_window {
    type = "WEEKLY"
    day  = "SAT"
    hour = 12
  }
  database {
    name  = "testing"
    owner = "babutz"
  }
  user {
    name       = var.name
    password   = var.password
    conn_limit = 50
    permission {
      database_name = "testing"
    }
    settings = {
      default_transaction_isolation = "read committed"
      log_min_duration_statement    = 5000
    }
  }
  host {
    zone             = "ru-central1-a"
    subnet_id        = yandex_vpc_subnet.snp.id
    assign_public_ip = "true"
  }
}
resource "yandex_vpc_network" "snp" {}
resource "yandex_vpc_subnet" "snp" {
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.snp.id
  v4_cidr_blocks = ["10.5.0.0/24"]
}
