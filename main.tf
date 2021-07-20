variable "region" { }
variable "project_name" { }
variable "billing_account" { }
variable "org_id" { }

locals {
  project_prefix = join("", [lower(replace(var.project_name, " ", "-")), "-"])
}

provider "google" { 
  region = var.region
}

data "google_billing_account" "my_billing_account" {
  billing_account = var.billing_account
}

resource "random_id" "id" {
  byte_length = 4
  prefix = local.project_prefix
}

resource "google_project" "project" {
  name = var.project_name
  project_id = random_id.id.hex  
  billing_account = data.google_billing_account.my_billing_account.id
  org_id = var.org_id
}

output "id" {
  value = google_project.project.id
}

output "number" {
  value = google_project.project.number
}

terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 3.75"
    }
    random = {
     source = "hashicorp/random"
      version = ">= 3.1"
    }
  }
}
