variable "requested_by" {
  type    = string
  default = "AFT Management"
}

variable "accounts" {
  type = map(object({
    email         = string,
    sso_email     = string,
    name          = string,
    managed_ou    = string,
    first_name    = string,
    last_name     = string,
    change_reason = string,
    tags          = map(string),
    custom_fields = map(string)
  }))
  default     = {}
  description = "AWS Account Map"
}
