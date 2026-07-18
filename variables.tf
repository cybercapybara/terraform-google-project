variable "project_id" {
  description = "Globally unique id of the project to create."
  type        = string
}

variable "name" {
  description = "Human-readable display name of the project."
  type        = string
}

variable "org_id" {
  description = "Numeric organization id the project belongs to. Mutually exclusive with folder_id."
  type        = string
  default     = null
}

variable "folder_id" {
  description = "Numeric folder id the project belongs to. Mutually exclusive with org_id."
  type        = string
  default     = null
}

variable "billing_account" {
  description = "Billing account id to associate with the project."
  type        = string
  default     = null
}

variable "auto_create_network" {
  description = "Whether to create the default network. Usually disabled in favor of a custom VPC."
  type        = bool
  default     = false
}

variable "activate_apis" {
  description = "APIs to enable on the project."
  type        = list(string)
  default     = []
}

variable "labels" {
  description = "Labels applied to the project."
  type        = map(string)
  default     = {}
}
