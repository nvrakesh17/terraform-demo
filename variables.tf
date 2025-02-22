variable "project_id" {
  description = "automatic-bond-451709-k3"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-central1-a"
}

variable "instance_name" {
  description = "Name of the VM instance"
  type        = string
  default     = "my-compute-vm"
}

variable "machine_type" {
  description = "Compute Engine instance type"
  type        = string
  default     = "e2-medium"
}

variable "image" {
  description = "OS Image for VM"
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "disk_size" {
  description = "Disk size in GB"
  type        = number
  default     = 20
}

