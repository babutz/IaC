variable "token" {
  description = "TOKEN YandexCloud"
  default     = "${TOKEN}"
}

variable "cloud_id" {
  description = "ID cloud-praktikumdevopscourse"
  default     = "b1g3jddf4nv5e9okle7p"
}

variable "folder_id" {
  description = "ID students-chapter-5-beta"
  default     = "b1gk960dgke8q6mb3j64"
}

variable "zone" {
  description = "zone"
  default     = "ru-central1-a"
}

variable "name_serv" {
  description = "name"
  default     = "terraform-babentsov"
}

variable "image_id" {
  description = "image dist"
  default     = "fd80qm01ah03dkqb14lc"
}

variable "network_name" {
  default = "net-babentsov"
}

variable "network_zone" {
  default = "ru-central1-a"
}

variable "network_id" {
  default = "enpm6e1qncdi27cijlj0"
}

variable "cidr_blocks" {
  default = ["192.168.108.0/24"]
}
