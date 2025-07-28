variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "cluster_version" {
  type    = string
  default = "1.29"
}
variable "assume_role_arn" {
  type = string
  description = "IAM role to assume for usstaging deployment"
}
