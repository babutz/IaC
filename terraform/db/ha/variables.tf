variable "token" {
  description = "TOKEN YandexCloud"
  default     = "${SECRET}"
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

variable "name" {
  description = "name"
  default     = "babutz"
}

variable "password" {
  description = "password"
  default     = "${SECRET}"
}
