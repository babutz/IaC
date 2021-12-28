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
  default     = "b1gk960dgke8q6mb3j64"
}

variable "zone" {
  description = "zone"
  default     = "ru-central1-a"
}


variable "image_id" {
  description = "image dist"
  default     = "fd80qm01ah03dkqb14lc"
}

variable "subnet_id" {
  default = %secret%
}


