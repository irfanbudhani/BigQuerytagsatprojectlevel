variable "project" {
  type        = string
  description = "The ID of the project in which the resource belongs."
}

variable "project_number" {
  type        = string
  description = "The number of the project in which the resource belongs."
}

variable "ppt_ad_group" {
  type        = string
  description = "ppt AD group"
}

variable "ppt_datasets" {
  type    = list(string)
  description = "List of dataset names to tag"
}
