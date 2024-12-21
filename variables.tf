variable "credentials" {
  description = "My Credentials"
  default     = "~/.gcp/green-calling-444717-c7-e5913373d028.json"
}

variable "project" {
  description = "Project"
  default     = "green-calling-444717-c7"
}

variable "region" {
  description = "Region"
  default     = "us-east1"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "dezc_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "dezc-terraform-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}