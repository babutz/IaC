variable "token" {
  description = "TOKEN YandexCloud"
  default     = %secret%
}

variable "cloud_id" {
  description = "ID cloud"
  default     = %secret%
}

variable "folder_id" {
  description = "ID folder"
  default     = %secret%
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
  default = "default-babentsov"
}

variable "network_zone" {
  default = "ru-central1-a"
}

variable "network_id" {
  default = %secret%
}

variable "cidr_blocks" {
  default = ["192.168.99.0/24"]
}
