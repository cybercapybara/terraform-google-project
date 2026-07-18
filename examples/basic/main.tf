terraform {
  required_version = ">= 1.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "project" {
  source = "../.."

  project_id      = "example-project-1234"
  name            = "Example Project"
  org_id          = var.org_id
  billing_account = var.billing_account

  activate_apis = [
    "compute.googleapis.com",
    "storage.googleapis.com",
  ]
}

variable "project_id" {
  description = "Existing project ID used to configure the google provider."
  type        = string
}

variable "org_id" {
  description = "Organization id the new project is created under."
  type        = string
}

variable "billing_account" {
  description = "Billing account associated with the new project."
  type        = string
}

variable "region" {
  description = "Region for the google provider."
  type        = string
  default     = "us-central1"
}

output "project_number" {
  value = module.project.number
}
