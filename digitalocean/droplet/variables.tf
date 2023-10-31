variable "region"{
    type = string
    default = "lon1"
}

variable "instance_name" {
    type = string
    default = "test-server"
}

variable "instance_volume_name" {
    type = string
    default = "test-server-backup-volume"
}