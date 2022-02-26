##
## These variables need to be provided by tfvars or by variables in Terraform Cloud.
##

variable "apikey" {
  description = "This value is used to connect the Intersight provider"
  type        = string
}

variable "secretkey" {
  description = "This value is used to connect the Intersight provider"
  type        = string
}

variable "serial" {
  description = "Serial number of standalone server to apply profile"
  type        = string
}
