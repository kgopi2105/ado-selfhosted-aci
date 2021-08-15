variable "projectname" {
  type        = string
  description = "Project code"
  default     = "lab01"
}

variable "tags" {
  description = "project tags"
  default = {
    "env"     = "dev"
    "project" = "lab01"
  }
}

variable "ado_secerts" {
  description = "AZ Devops Values"
  default = {
    AZP-URL        = ""
    AZP-TOKEN      = ""
    AZP-AGENT-NAME = ""
  }
}
